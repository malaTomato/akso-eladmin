package com.akso.modules.akso.service;

import cn.hutool.core.collection.CollectionUtil;
import com.akso.modules.akso.domain.*;
import com.akso.modules.akso.entity.AksoUser;
import com.akso.modules.akso.entity.QuestionConfig;
import com.akso.modules.akso.param.ExportParam;
import com.akso.modules.akso.dto.RecordDetail;
import com.akso.modules.akso.entity.QuestionRecordEntity;
import com.akso.modules.akso.param.RecordParam;
import com.akso.modules.akso.repository.AksoUserMapper;
import com.akso.modules.akso.repository.QuestionConfigMapper;
import com.akso.modules.akso.repository.QuestionRecordMapper;
import com.akso.utils.StringUtils;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import lombok.extern.slf4j.Slf4j;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;

import javax.persistence.criteria.Predicate;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.OutputStream;
import java.time.LocalDateTime;
import java.util.*;
import java.util.stream.Collectors;

/**
 * @author xiongwu
 **/
@Service
@Slf4j
public class QuestionService {

    @Autowired
    private QuestionConfigMapper questionConfigMapper;
    @Autowired
    private QuestionRecordMapper questionRecordMapper;

    @Autowired
    private AksoUserMapper aksoUserMapper;

    public QuestionResponse getQuestion(Integer id) {

        QuestionConfig questionConfig = questionConfigMapper.getOne(id);
        log.info("config:{}",JSONObject.toJSONString(questionConfig));
        String config = questionConfig.getConfig();
        List<Question> questions = JSONArray.parseArray(config, Question.class);
        QuestionResponse questionResponse = new QuestionResponse();
        questionResponse.setId(questionConfig.getId());
        questionResponse.setName(questionConfig.getTitle());
        questionResponse.setQuestions(questions);
        return questionResponse;
    }

    public void commit(RecordDto recordDto) {
        QuestionRecordEntity questionRecordEntity = new QuestionRecordEntity();
        questionRecordEntity.setConfigId(recordDto.getId());
        questionRecordEntity.setOpenId(recordDto.getOpenid());
        AksoUser user = aksoUserMapper.findByOpenId(recordDto.getOpenid());
        questionRecordEntity.setUsername(user.getUsername());
        questionRecordEntity.setPhone(user.getPhone());
        questionRecordEntity.setRecord(recordDto.getRecords());
        questionRecordEntity.setCreateTime(LocalDateTime.now());
        questionRecordEntity.setUpdateTime(LocalDateTime.now());
        questionRecordMapper.save(questionRecordEntity);
    }

    public Page<QuestionRecordEntity> queryQuestionRecord(RecordParam recordParam) {
        Pageable pageable = new PageRequest(recordParam.getPageIndex(), recordParam.getPageSize(), Sort.Direction.ASC, "id");

        Page<QuestionRecordEntity> bookPage = questionRecordMapper.findAll((Specification<QuestionRecordEntity>) (root, criteriaQuery, criteriaBuilder) -> {
            List<Predicate> list = new ArrayList<>();
            if (StringUtils.isNotBlank(recordParam.getOpenId())){
                list.add(criteriaBuilder.equal(root.get("openId").as(String.class),recordParam.getOpenId()));
            }
            if (StringUtils.isNotBlank(recordParam.getUsername())){
                list.add(criteriaBuilder.equal(root.get("username").as(String.class),recordParam.getUsername()));
            }
            if (StringUtils.isNotBlank(recordParam.getMobile())){
                list.add(criteriaBuilder.equal(root.get("phone").as(String.class),recordParam.getMobile()));
            }
            if (StringUtils.isNotBlank(recordParam.getStartTime())){
                list.add(criteriaBuilder.between(root.get("createTime").as(String.class),recordParam.getStartTime(),recordParam.getEndTime()));
            }
            Predicate[] p = new Predicate[list.size()];
            return criteriaBuilder.and(list.toArray(p));
        },pageable);
        if (CollectionUtil.isNotEmpty(bookPage.getContent())){
            buildQuestionRecordEntity(bookPage.getContent());
        }
        return bookPage;
    }
    private void buildQuestionRecordEntity(List<QuestionRecordEntity> content){
        List<Integer> collect = content.stream().map(QuestionRecordEntity::getConfigId).collect(Collectors.toList());
        List<QuestionConfig> configs = questionConfigMapper.findByIdIn(collect);
        Map<Integer, String> map = configs.stream().collect(Collectors.toMap(QuestionConfig::getId, QuestionConfig::getTitle));
        content.forEach(v->v.setTitle(map.get(v.getConfigId())));
    }


    public RecordDetail getRecord(Integer id) {
        QuestionRecordEntity recordEntity = questionRecordMapper.getOne(id);
        QuestionConfig questionConfig = questionConfigMapper.getOne(recordEntity.getConfigId());
        RecordDetail  recordDetail = new RecordDetail();
        recordDetail.setTitle(questionConfig.getTitle());
        List<Question> questionList = new ArrayList<>();
        JSONObject rd = JSONObject.parseObject(recordEntity.getRecord());
        List<Question> questions = JSONArray.parseArray(questionConfig.getConfig(), Question.class);
        for (Question question : questions){
            question.setAnswer(JSONObject.toJSONString(rd.get(question.getId().toString())));
            questionList.add(question);
        }
        recordDetail.setQuestions(questionList);
        return recordDetail;
    }

    public void export(HttpServletRequest request, HttpServletResponse response,ExportParam exportParam) {

        List<QuestionRecordEntity> records = questionRecordMapper.findAllById(exportParam.getIds());
        buildQuestionRecordEntity(records);

        HSSFWorkbook wb = new HSSFWorkbook();

        HSSFSheet sheet = wb.createSheet("记录");

        HSSFRow head;

        int columnIndex = 0;

        head = sheet.createRow(0);
        head.setHeight((short) (22.50 * 20));//设置行高
        head.createCell(columnIndex).setCellValue("序号");
        head.createCell(++columnIndex).setCellValue("姓名");
        head.createCell(++columnIndex).setCellValue("手机号");
        head.createCell(++columnIndex).setCellValue("问卷标题");
        head.createCell(++columnIndex).setCellValue("回答记录");

        for (int i = 0; i < records.size(); i++) {

            HSSFRow row = sheet.createRow(i + 1);
            QuestionRecordEntity entity = records.get(i);
            columnIndex = 0;
            row.createCell(columnIndex).setCellValue(i + 1);
            row.createCell(++columnIndex).setCellValue(entity.getUsername());
            row.createCell(++columnIndex).setCellValue(entity.getPhone());
            row.createCell(++columnIndex).setCellValue(entity.getTitle());
            String record = entity.getRecord();
            JSONObject jsonObject = JSONObject.parseObject(record);
            Set<String> strings = jsonObject.keySet();
            for (String key:strings) {
                row.createCell(++columnIndex).setCellValue(JSONObject.toJSONString(jsonObject.get(key)));
            }
        }
        sheet.setDefaultRowHeight((short) (16.5 * 20));

        //列宽自适应
        for (int i = 0; i <= 11; i++) {
            sheet.autoSizeColumn(i);
        }

        String title= "czjl_all";
        response.setHeader("Content-disposition", "attachment;fileName=" + title + ".xls");
        response.setContentType("application/octet-stream;charset=utf-8");
        try (OutputStream ouputStream = response.getOutputStream()){
            wb.write(ouputStream);
            ouputStream.flush();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}

/*
 * @Author: tangjs 
 * @Date: 2019-12-25 15:06:34 
 * @Last Modified by: liuyr
 * @Last Modified time: 2019-12-29 10:21:43
 */
import axios from '@/utils/axios';

/**
 * 通过id删除职位信息
 * @param {Object} param {id:''}
 */
export function deleteJobTypeById(param){
    return axios.post('/JobType/deleteById',param);
}

/**
 * 查找所有职位信息
 */
export function findAllJobType(){
    return axios.get('/JobType/findAll');
}

/**
 * 通过id查找职位信息
 * @param {Object} param {id:''}
 */
export function findJobTypeById(param){
    return axios.get('/JobType/findById',{params:param});
}

/**
 * 保存和更新职位信息
 * @param {Object} param
 */
export function saveOrUpdateJobType(param){
    return axios.post('/JobType/saveOrUpdate',param);
}
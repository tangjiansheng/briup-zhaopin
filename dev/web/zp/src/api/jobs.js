/*
 * @Author: liuyr 
 * 职位模块API
 * @Date: 2019-12-22 18:54:17 
 * @Last Modified by: liuyr
 * @Last Modified time: 2019-12-29 08:56:46
 */
import axios from '@/utils/axios'
/**
 * 通过id删除职位信息
 * @param {Object} param {id:''} 
 */
export function deleteJobsById(param) {
  return axios.post('/Jobs/deleteById', param);
}
/**
 * 查找所有职位信息
 */
export function findAllJobs() {
  return axios.get('/Jobs/findAll');
}
/**
 * 通过id查找职位信息
 * @param {Object} param {id:''}
 */
export function findJobsById(param) {
  return axios.get('/Jobs/findById', {
    params: param
  });
}
/**
 * 通过Status查找职位信息
 * @param {Object} param {Status:''}
 */
export function findJobsByStatus(param) {
  return axios.get('Jobs/findByStatus', {
    params: param
  });
}
/**
 * 保存或更新职位信息
 * @param {Object} param
 */
export function saveOrUpdateJobs(param) {
  return axios.post('/Jobs/saveOrUpdate', param);
}

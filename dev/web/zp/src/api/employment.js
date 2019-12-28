/*
 * @Author: tangjs 
 * @Date: 2019-12-25 16:44:15 
 * @Last Modified by: tangjs
 * @Last Modified time: 2019-12-26 20:13:50
 */

import axios from '@/utils/axios'

/**
 * 通过id删除招聘信息
 * @param {Object} param {id:''}
 */
export function deleteEmploymentById(param){
    return axios.post('/Employment/deleteById',param);
}

/**
* 查找所有招聘信息
*/
export function findAllEmployment(){
    return axios.get('/Employment/findAll');
}
/**
 * 通过城市id查找招聘信息
 * @param {Object} param {scary:''}
 */
export function findEmploymentByCity(param){
    return axios.get('/Employment/findByCity',{params:param});
}

/**
 * 通过id查找招聘信息
 * @param {Object} param {id:''}
 */
export function findEmploymentById(param){
    return axios.get('/Employment/findById',{params:param});
}

/**
 * 通过职位查找招聘信息
 * @param {Object} param {job:''}
 */
export function findEmploymentByJob(param){
    return axios.get('/Employment/findByJob',{params:param});
}

/**
 * 通过招聘标题查找招聘信息
 * @param {Object} param {title:''}
 */
export function findEmploymentByTitle(param){
    return axios.get('/Employment/findByTitle',{params:param});
}

/**
 * 通过招聘标题查找招聘信息
 * @param {Object} param {welfare:''}
 */
export function findEmploymentByWelfare(param){
    return axios.get('/Employment/findByWelfare',{params:param});
}

/**
 * 保存和更新商家信息
 * @param {Object} param
 */
export function saveOrUpdateEmployment(param){
    return axios.post('/Employment/saveOrUpdate',param);
}
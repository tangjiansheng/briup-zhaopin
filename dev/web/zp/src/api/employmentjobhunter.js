/*
 * @Author: Amily 
 * 客服API
 * @Date: 2019-12-25 16:59:25 
 * @Last Modified by: Amily
 * @Last Modified time: 2019-12-28 22:45:55
 */

import axios from '@/utils/axios'

/**
 * 通过id删除求职信息
 * @param {object} param {id:''}
 */
export function deleteEmploymentJobhunterById (param){
    return axios.post('/EmploymentJobhunter/deleteById',param);
}

/**
 * 查找所有客服信息
 */
export function findAllEmploymentJobhunter(){
    return axios.get('/EmploymentJobhunter/findAll');
}

/**
 * 查找所有客服信息（扩展）
 */
export function findAllWithJobhAndEmpl(){
    return axios.get('/EmploymentJobhunter/findAllWithJobhAndEmpl');
}

/**
 * 通过id查找求职信息
 */
export function findEmploymentJobhunterById(param){
    return axios.get('/EmploymentJobhunter/findById',{params:param});
}
/**
 * 保存或更新求职信息
 * @param {object} param {id:''}
 */
export function saveOrUpdateEmploymentJobhunter (param){
    return axios.post('/EmploymentJobhunter/saveOrUpdate',param);
}
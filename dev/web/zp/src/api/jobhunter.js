/*
 * @Author: RealsenWang 
 * @Date: 2019-12-26 15:21:28 
 * @Last Modified by: RealsenWang
 * @Last Modified time: 2019-12-26 15:50:39
 */
import axios from '@/utils/axios'

/**
 *
 * 通过ID删除用户信息
 * @export
 * @param {Object} param {id:''}
 * @returns
 */
export function deleteJobhunterById(param){
    return axios.post('/Jobhunter/deleteById',param);
}
/**
 *
 * 查找所有用户信息
 * @export
 * @returns
 */
export function findAllJobhunter(){
    return axios.get('/Jobhunter/findAll');
}
/**
 *
 * 通过最高学历查找用户信息
 * @export
 * @param {Object} param {education:''}
 * @returns
 */
export function findJobhunterByEducation(param){
    return axios.get('/Jobhunter/findByEducation',{params:param});
}
/**
 *
 * 通过性别查找用户信息
 * @export
 * @param {Object} param {gender:''}
 * @returns
 */
export function findJobhunterByGender(param){
    return axios.get('/Jobhunter/findByGender',{params:param});
}
/**
 *
 * 通过ID查找用户信息
 * @export
 * @param {Object} param {id:''}
 * @returns
 */
export function findJobhunterById(param){
    return axios.get('/Jobhunter/findById',{params:param});
}
/**
 *
 * 通过电话查找用户信息
 * @export
 * @param {Object} param {telephone:''}
 * @returns
 */
export function findJobhunterByTelephone(param){
    return axios.get('/Jobhunter/findByTelephone',{params:param});
}
/**
 *
 * 通过用户名查找用户信息
 * @export
 * @param {Object} param {username:''}
 * @returns
 */
export function findJobhunterByUsername(param){
    return axios.get('/Jobhunter/findByUsername',{params:param});
}
/**
 *
 * 快速注册用户信息
 * @export
 * @param {Object} param {id:''}
 * @returns
 */
export function quickRegistrationJobhunter(param){
    return axios.post('/Jobhunter/quickRegistration',param);
}
/**
 *
 * 通过ID保存和修改用户信息
 * @export
 * @param {Object} param {id:''}
 * @returns
 */
export function saveOrUpdateJobhunter(param){
    return axios.post('/Jobhunter/saveOrUpdate',param);
}

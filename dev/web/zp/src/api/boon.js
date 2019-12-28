/*
 * @Author: liuyr 
 * 福利API
 * @Date: 2019-12-25 09:02:21 
 * @Last Modified by: liuyr
 * @Last Modified time: 2019-12-27 18:55:06
 */
import axios from '@/utils/axios';
/**
 * 通过id删除福利信息
 * @param {Object} param {id:''} 
 */
export function deleteWelfareById(param) {
  return axios.post('/Welfare/deleteById', param);
}
/**
 * 查找所有福利信息
 */
export function findAllWelfare() {
  return axios.get('/Welfare/findAll');
}
/**
 * 通过城市查找福利信息
 * @param {Object} param {city:''}
 */
export function findWelfareByCity(param) {
  return axios.get('/Welfare/findByCity', {
    params: param
  });
}
/**
 * 通过id查找福利信息
 * @param {Object} param {id:''}
 */
export function findWelfareById(param) {
  return axios.get('/Welfare/findById', {
    params: param
  });
}


/**
 * 通过行业查找福利信息
 * @param {Object} param {industry:''}
 */
export function findWelfareByIndustry(param) {
  return axios.get('/Welfare/findByIndustry', {
    params: param
  });
}
/**
 * 通过位置查找福利信息
 * @param {Object} param {location:''}
 */
export function findWelfareByLocation(param) {
  return axios.get('/Welfare/findByLocation', {
    params: param
  });
}

/**
 * 通过省份查找福利信息
 * @param {Object} param {province:''}
 */
export function findWelfareByProvince(param) {
  return axios.get('/Welfare/findByProvince', {
    params: param
  });
}
/**
 * 通过规模查找福利信息
 * @param {Object} param {scale:''}
 */
export function findWelfareByScale(param) {
  return axios.get('/Welfare/findByScale', {
    params: param
  });
}
/**
 * 保存或更新福利信息
 * @param {Object} param
 */
export function saveOrUpdateWelfare(param) {
  return axios.post('/Welfare/saveOrUpdate', param);
}

/*
 * @Author: mikey.zhaopeng 
 * @Date: 2019-12-25 15:02:55 
 * @Last Modified by: mikey.zhaopeng
 * @Last Modified time: 2019-12-27 09:22:56
 */

import axios from '@/utils/axios'
/**
 *
 *查询所有的求职信息
 */
export  function findAllEmploymentJobhunter() {
    return axios.post('/EmploymentJobhunter/findAll');
   }
/**
 *查询所有求职信息(扩展)
 *
 */
export  function findAllEmploymentWithJobhAndEmpl() {
    return axios.get('/EmploymentJobhunter/findAllWithJobhAndEmpl');
}
/**
 *根据id查询求职信息
 *
 */
export  function findAllWithJobhAndEmpl(param) {
    return axios.post('/EmploymentJobhunter/findById',param);
}
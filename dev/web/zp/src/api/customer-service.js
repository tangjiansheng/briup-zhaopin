/*
 * @Author: mikey.zhaopeng 
 * @Date: 2019-12-27 09:22:13 
 * @Last Modified by: mikey.zhaopeng
 * @Last Modified time: 2019-12-28 08:57:17
 */
import axios from '@/utils/axios'
/**
 *
 *查找所有的客服
 */
export  function findAllCustomerService() {
    return axios.get('/CustomerService/findAll');
}

/**  
 * 通过学历查找客服
*/
export  function findCustomerServiceByEducation(param) {
    return axios.get('/CustomerService/findByEducation',{params:param});
}
/**     
 * 通过性别查找客服
 */
export  function findCustomerServiceByGender(param) {
    return axios.get('/CustomerService/findByGender',{params:param});
}
/**    
 *通过Id查找客服
 */
export  function findCustomerServiceById(param) {
    return axios.get('/CustomerService/findById',{params:param});
}
/**     
 * 通过用户名查找客服
 */
export  function findCustomerServiceByUsername(param) {
    return axios.get('/CustomerService/findByUsername',{params:param});}
/**   
 * 通过Id删除数据
 */
export  function deleteCustomerServiceById(param) {
    return axios.post('/CustomerService/deleteById',param);
}
    
   
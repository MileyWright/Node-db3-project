const db = require('../data/dbConfig.js');

module.exports = {
    find,
    findById,
    findSteps,
    add,
    update, 
    remove
}

function find(){
    return db('schemes');
}

function findById(id) {
    return db('schemes')
    .where({id})
    .first();
}

function findSteps(id) {
    return db('steps')
    .join('schemes', 'steps.scheme_id', 'schemes.id')
    .select('schemes.id','scheme_name', 'step_number', 'instructions')
    .where('scheme_id',id)
    .orderBy('step_number')
   
}

function add(scheme) {
    return db('schemes')
    .insert(scheme, 'id')
    .then(ids => {
        return findById(ids[0])
    })
}
 function update(changes, id) {
     return db('schemes')
     .where('id', id)
     .update(changes)
     .then(count => (
         count > 0 ? this.get(id) : null
     ))
 }

function remove(id) {
    return db('schemes')
    .where('id', id)
    .del();
}
const db = require('../data/db-config.js');

function find() {
    return db('schemes');
}

function findById(id) {
    return db('schemes')
        .where({id})
        .first();
}

function findSteps(id) {
    return db('schemes as sc')
        .join('steps as st', 'sc.id', 'st.scheme_id')
        .select('st.id', 'scheme_name', 'step_number', 'instructions')
        .where({ scheme_id: id})
        .orderBy('step_number');
}

function add(newScheme) {
    return db('schemes')
        .insert(newScheme);
}

function addStep(stepData, id) {
    const newStep = {...stepData, scheme_id : id}
    return db('steps')
        .insert(newStep);
}

function update(changes, id) {
    return db('schemes')
        .where({id})
        .update(changes);
}

function remove(id) {
    return db('schemes')
        .where({id})
        .delete();
}

module.exports = {
    find,
    findById,
    findSteps,
    add,
    addStep,
    update,
    remove
}
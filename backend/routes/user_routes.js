const express = require('express')
const actions = require('../methods/actions')
const router = express.Router()

//@desc testing server
// router.get('/',(req,res)=>{
//     res.send('Neopolis Development')
// })


//@desc sign_up new user
//@route POST /sign_up
router.post('/sign_up', actions.sign_up)

//@desc sign_in a user
//@route POST /sign_in
router.post('/sign_in', actions.sign_in)


module.exports = router
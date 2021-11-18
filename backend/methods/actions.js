var User = require('../models/user')
var jwt = require('jwt-simple')
var config = require('../config/dbconfig')

var functions = {
    sign_up: function (req, res) {
        const emailRegexp = /^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$/;
        
        if ((!req.body.fullname) ||(!req.body.email) || (!req.body.password)) {
            res.json({success: false, msg: 'Enter all fields'})
        } else if(!emailRegexp.test(req.body.email)){
            res.json({success: false, msg: 'Enter correct email address'})
        } else {
            var newUser = User({
                fullname: req.body.fullname,
                email: req.body.email,
                password: req.body.password
            });
            

            User.findOne({
                email: req.body.email
            }, function (err, user) {
                    if (err) throw err
                    if (!user) {
                        newUser.save(function (err, newUser) {
                            if (err) {
                                res.json({success: false, msg: 'Failed to save'})
                            }
                            else {
                                res.json({success: true, msg: 'Successfully saved'})
                            }
                        })
                    } else {
                        res.status(403).send({success: false, msg: 'Already registred with this email!'})
                        
                    }
            }
            )
        }
    },
    sign_in: function (req, res) {
        if ((!req.body.email) || (!req.body.password)) {
            res.json({success: false, msg: 'Enter all fields',token: ''})
        }
        else {User.findOne({
            email: req.body.email
        }, function (err, user) {
                if (err) throw err
                if (!user) {
                    res.status(403).send({success: false, msg: 'User not found',token: ''})
                }

                else {
                    user.comparePassword(req.body.password, function (err, isMatch) {
                        if (isMatch && !err) {
                            var token = jwt.encode(user, config.secret)
                            res.json({success: true, msg: 'Logged in successfuly', token: token})
                        }
                        else {
                            return res.status(403).send({success: false, msg: 'wrong password', token: ''})
                        }
                    })
                }
        }
        )}
    },
}

module.exports = functions
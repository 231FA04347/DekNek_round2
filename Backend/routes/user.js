const express = require('express');
const User = require('../models/User');
const auth = require('../middleware/auth');

const router = express.Router();

// Get Current User
router.get('/me', auth, async (req, res) => {
  try {
    const user = await User.findById(req.userId);
    res.json(user);
  } catch (error) {
    res.status(500).json({ message: 'Server error', error: error.message });
  }
});

// Update User Profile
router.put('/update', auth, async (req, res) => {
  try {
    const { firstName, lastName, bio, phone } = req.body;

    const user = await User.findByIdAndUpdate(
      req.userId,
      {
        firstName: firstName || undefined,
        lastName: lastName || undefined,
        'profile.bio': bio || undefined,
        'profile.phone': phone || undefined,
      },
      { new: true }
    );

    res.json({
      message: 'Profile updated successfully',
      user,
    });
  } catch (error) {
    res.status(500).json({ message: 'Server error', error: error.message });
  }
});

// Get All Users (for admin purposes)
router.get('/all', auth, async (req, res) => {
  try {
    const users = await User.find().select('-password');
    res.json(users);
  } catch (error) {
    res.status(500).json({ message: 'Server error', error: error.message });
  }
});

// Delete User Account
router.delete('/delete', auth, async (req, res) => {
  try {
    await User.findByIdAndDelete(req.userId);
    res.json({ message: 'Account deleted successfully' });
  } catch (error) {
    res.status(500).json({ message: 'Server error', error: error.message });
  }
});

module.exports = router;

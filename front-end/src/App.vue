<template>
  <router-view />
</template>
<style>

@import url('https://fonts.googleapis.com/icon?family=Material+Icons');
.profile-box {
  background: linear-gradient(90deg,rgb(29, 4, 140),rgb(75, 8, 122));
  direction: ltr;
  display: flex;
  justify-content: space-between;
  justify-self: flex-end;
  width: 300px;
  align-items: center;
  color: #f0f0f0;
  padding: 10px;
  border-radius: 10px;
}

.profile-name {
  font-size: 1.2rem;
  display: flex;
  align-items: center;
  gap: 1rem;
  font-weight: 500;
  text-shadow: 0 0 3px #00000044;
}

.profile-box .material-icons {
  font-size: 28px;
  cursor: pointer;
  transition: transform 0.2s ease, color 0.3s;
}

.profile-box .material-icons:hover {
  transform: scale(1.1);
  color: #66ccff;
}

nav{
  background: linear-gradient(90deg,rgb(29, 4, 140),rgb(75, 8, 122));
  color: #fff;
  padding: 1rem 2rem;
  display: flex;
  align-items: center;
  justify-content: space-between;
  flex-wrap: wrap;
  box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
  border-radius: 0 0 12px 12px;
}

#logout_btn{
  background-color: transparent;
}
</style>

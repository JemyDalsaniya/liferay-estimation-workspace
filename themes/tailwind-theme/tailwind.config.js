module.exports = {
  content: [
    "./src/**/*.{html,js,jsx,ts,tsx}",
  ],
  theme: {
    fontFamily: {
      'body': ['Lemon'],
      'sans': ['Lemon']
    },
    colors: {
      transparent: 'transparent',
      black: '#000',
      white: '#fff',
      gray: {
        100: '#f7fafc',
        300: '#1a202c',
      },
      nav :{
        100: "#040e14",
        400: "#373a40"
      },
      form :{
        100:"#d565a4",
        400:"#bee6f7"
      }
    },
    extend: {},
  },
  darkMode: 'class',
  plugins: [
    require('flowbite/plugin'),
    require('@tailwindcss/line-clamp'),
  ],
}

# Liferay Exercise Implementation Steps

## 1. Create Liferay Workspace

- Download the Liferay workspace from [here]().

## 2. Create Classic Theme in Liferay

- Generate a classic theme using Liferay Theme Generator.
  ```
  yo liferay-theme:classic
  ```

- Add Tailwind CSS to the theme.
  ```
  cd themes/<your_theme_name>
  npm install tailwindcss postcss-cli autoprefixer
  npx tailwindcss init
  ```

- Configure Tailwind CSS in `tailwind.config.js`.
  ```javascript
  /** @type {import('tailwindcss').Config} */
  module.exports = {
    content: [
      "./src/**/*.{js,jsx,ts,tsx}",
    ],
    theme: {
      extend: {},
    },
    plugins: [],
  };
  ```

- Set up PostCSS Configuration in `postcss.config.js`.
  ```javascript
  module.exports = {
    plugins: [
      require('tailwindcss'),
      require('autoprefixer'),
    ],
  };
  ```
  ###### Note: Make sure to keep the node and npm version as below
  ###### Node : 16.13.0
  ###### NPM : 8.1.0


- Add Tailwind CSS to `custom.scss`.
  ```scss
  @import 'tailwindcss/base';
  @import 'tailwindcss/components';
  @import 'tailwindcss/utilities';
  ```

- Configure Theme:
  ```javascript
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
  },
  ```
  In the Below Screenshot, Font of title and description are coming from the theme configuration




## 3. Create Fragment

- Open the Liferay Product menu.
- Navigate to Design -> Fragments.
- Create new fragment set
    - Create new fragment inside created fragment set
      ![Screenshot from 2024-01-19 16-45-50](https://github.com/JemyDalsaniya/liferay-estimation-workspace/assets/100910972/ab77ac6f-6f50-495e-9eac-613b7cce3fe2)
      List of custom components created using Tailwind CSS and Flowbite are :
      1. Card
      2. Accordion
      3. Buttons
      4. Form
      
      Example : 
        - create fragment for different buttons
            -  Add HTMl,JavaScript,CSS code for buttons inside it's respective sections

  ###### Note: 
 1. We need to change one setting enable from Control Panel -> System Settings -> Page Fragments make all the checkbox enable
 2. Please find the Fragment code inside [fragment_script](https://github.com/JemyDalsaniya/liferay-estimation-workspace/tree/inexture-liferay/fragment_script) directory


## 4. Create Master Page Template

### Create Fragment for Language Translation

- Open the Liferay Product menu.
- Go to Design -> Fragments.

  ![Screenshot from 2024-01-19 10-38-32](https://github.com/riddhi-Jani123/testing/assets/100912019/36d62c1e-db5c-4579-861a-9c357c180614)

- Copy the liferay default Header dark and Footer dark components.
- Replace hardcoded text with language keys (e.g., `[@liferay.language key="Sign-in-key" /]`).

### Add Language Key

- Go to Control Panel -> Configuration -> Language Override.
  ![Screenshot from 2024-01-19 10-53-46](https://github.com/riddhi-Jani123/testing/assets/100912019/e2971f72-a888-43e8-9eda-dace99d76405)
- Click the plus icon to add the language key.
  ![Screenshot from 2024-01-19 11-14-41](https://github.com/riddhi-Jani123/testing/assets/100912019/9859f285-5b39-4b4b-9a47-0dcba1389c9a)

### Create Template

- Open the Liferay Product menu.
- Go to Design -> Page Templates.

  ![Screenshot from 2024-01-19 11-17-57](https://github.com/riddhi-Jani123/testing/assets/100912019/955da7e6-66ac-4a60-9d6c-bf2939e2787c)

- Create a master page template.
- Drag and drop the fragments of the header and footer and also the fragments we have created in earlier step.
- Use the template to create a page.
- Inside "liferay-estimation-workspace" there will be template called "Custom Template" and
- also there will be a page called "Components Page" having all the required components and which is created from "Custom Template"
  - List of components:
    1. Card
    2. Accordion
    3. Buttons
    4. Form
    

**Note:** Replace `<link_to_download_liferay_workspace>` and `<your_theme_name>` with the appropriate values.

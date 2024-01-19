<!DOCTYPE html>

<#include init />

<html class="${root_css_class}" dir="<@liferay.language key="lang.dir" />" lang="${w3c_language_id}">

<head>
	<title>${html_title}</title>

	<meta content="initial-scale=1.0, width=device-width" name="viewport" />

	<@liferay_util["include"] page=top_head_include />
	<link href="https://cdnjs.cloudflare.com/ajax/libs/flowbite/2.2.1/flowbite.min.css" rel="stylesheet" />
	<link href="https://fonts.googleapis.com/css2?family=Lemon&display=swap" rel="stylesheet">
	<script>
		// On page load or when changing themes, best to add inline in `head` to avoid FOUC
		if (localStorage.getItem('color-theme') === 'dark' || (!('color-theme' in localStorage) && window.matchMedia('(prefers-color-scheme: dark)').matches)) {
			document.documentElement.classList.add('dark');
		} else {
			document.documentElement.classList.remove('dark')
		}
	</script>
</head>

<body class="${css_class} dark:bg-gray-900">

<@liferay_ui["quick-access"] contentId="#main-content" />

<@liferay_util["include"] page=body_top_include />

<div class="d-flex flex-column min-vh-100">
	<@liferay.control_menu />

	<div class="d-flex flex-column flex-fill position-relative" id="wrapper">
		<#if show_header>
			<header id="banner">
				<div class="navbar navbar-classic navbar-top py-3">
					<div class="container-fluid container-fluid-max-xl user-personal-bar">
						<div class="align-items-center autofit-row">
							<a class="${logo_css_class} align-items-center d-md-inline-flex d-sm-none d-none logo-md" href="${site_default_url}" title="<@liferay.language_format arguments="${site_name}" key="go-to-x" />">
								<img alt="${logo_description}" class="mr-2" height="56" src="${site_logo}" />

								<#if show_site_name>
									<h1 <#if show_control_menu>aria-hidden="true"</#if> class="font-weight-bold h2 mb-0 text-dark">${site_name}</h1>
								</#if>
							</a>

							<#assign preferences = freeMarkerPortletPreferences.getPreferences({"portletSetupPortletDecoratorId": "barebone", "destination": "/search"}) />

							<div class="autofit-col autofit-col-expand">
								<#if show_header_search>
									<div class="justify-content-md-end mr-4 navbar-form" role="search">
										<@liferay.search_bar default_preferences="${preferences}" />
									</div>
								</#if>
							</div>

							<div class="autofit-col">
								<@liferay.user_personal_bar />
							</div>
						</div>
					</div>
				</div>

				<div class="navbar navbar-classic navbar-expand-md navbar-light pb-3">
					<div class="container-fluid container-fluid-max-xl">
						<a class="${logo_css_class} align-items-center d-inline-flex d-md-none logo-xs" href="${site_default_url}" rel="nofollow">
							<img alt="${logo_description}" class="mr-2" height="56" src="${site_logo}" />

							<#if show_site_name>
								<h2 <#if show_control_menu>aria-hidden="true"</#if> class="font-weight-bold h2 mb-0 text-dark">${site_name}</h2>
							</#if>
						</a>

						<#include "${full_templates_path}/navigation.ftl" />
					</div>
				</div>
			</header>
		</#if>

		<section class="${portal_content_css_class} flex-fill" id="content">
			<#if selectable>
				<@liferay_util["include"] page=content_include />
			<#else>
				${portletDisplay.recycle()}

				${portletDisplay.setTitle(the_title)}

				<@liferay_theme["wrap-portlet"] page="portlet.ftl">
					<@liferay_util["include"] page=content_include />
				</@>
			</#if>
		</section>

		<#if show_footer>
			<footer id="footer">
				<div class="container">
					<div class="row">
						<div class="col-md-12 text-center text-md-left">
							<@liferay.language_format
								arguments='<a class="text-decoration-underline text-white" href="http://www.liferay.com" rel="external">Liferay</a>'
								key="powered-by-x"
							/>
						</div>
					</div>
				</div>
			</footer>
		</#if>
	</div>
</div>

<@liferay_util["include"] page=body_bottom_include />

<@liferay_util["include"] page=bottom_include />
<script src="https://cdnjs.cloudflare.com/ajax/libs/flowbite/2.2.1/flowbite.min.js"></script>
<script>
	//Manage Buttons for Hide/Show content
	const titleToggle = document.getElementById('titleToggle');
	const descriptionToggle = document.getElementById('descriptionToggle');
	const dropzoneToggle = document.getElementById('dropzoneToggle');
	const titleContent = document.getElementById('titleContent');
	const descriptionContent = document.getElementById('descriptionContent');
	const dropzoneContent = document.getElementById('dropzoneContent');

	titleToggle.addEventListener('click', function () {
		titleContent.classList.toggle('hidden');
	});

	descriptionToggle.addEventListener('click', function () {
		descriptionContent.classList.toggle('hidden');
	});

	dropzoneToggle.addEventListener('click', function () {
		dropzoneContent.classList.toggle('hidden');
	});
</script>
<script>
	//Manage Dark/Light Mode
	var themeToggleDarkIcon = document.getElementById('theme-toggle-dark-icon');
	var themeToggleLightIcon = document.getElementById('theme-toggle-light-icon');

	// Change the icons inside the button based on previous settings
	if (localStorage.getItem('color-theme') === 'dark' || (!('color-theme' in localStorage) && window.matchMedia('(prefers-color-scheme: dark)').matches)) {
		themeToggleLightIcon.classList.remove('hidden');
	} else {
		themeToggleDarkIcon.classList.remove('hidden');
	}

	var themeToggleBtn = document.getElementById('theme-toggle');

	themeToggleBtn.addEventListener('click', function() {

		// toggle icons inside button
		themeToggleDarkIcon.classList.toggle('hidden');
		themeToggleLightIcon.classList.toggle('hidden');

		// if set via local storage previously
		if (localStorage.getItem('color-theme')) {
			if (localStorage.getItem('color-theme') === 'light') {
				document.documentElement.classList.add('dark');
				localStorage.setItem('color-theme', 'dark');
			} else {
				document.documentElement.classList.remove('dark');
				localStorage.setItem('color-theme', 'light');
			}

			// if NOT set via local storage previously
		} else {
			if (document.documentElement.classList.contains('dark')) {
				document.documentElement.classList.remove('dark');
				localStorage.setItem('color-theme', 'light');
			} else {
				document.documentElement.classList.add('dark');
				localStorage.setItem('color-theme', 'dark');
			}
		}

	});
</script>
<script>
	//Manage RTL/LTR
	var wrapperList = document.querySelectorAll(".directionButtonWrapper");

	wrapperList.forEach((element) => {
		const dirButton = element.querySelector(".dirButton")
		const changeDirButton = element.querySelector(".changeDirButton")

		// Add click event listener to the button
		dirButton.addEventListener("click", function () {
			// Toggle between "rtl" and "ltr" for the dir attribute of the second button
			const newDir = changeDirButton.getAttribute("dir") === "ltr" ? "rtl" : "ltr";
			changeDirButton.setAttribute("dir", newDir);

			// Toggle between "RTL" and "LTR" for button text
			dirButton.innerHTML = dirButton.innerHTML === "RTL" ? "LTR" : "RTL";

		});
	})
</script>
</body>

</html>

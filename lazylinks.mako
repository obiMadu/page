<!DOCTYPE html>
<html lang="en-US">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="description" content="${config.description}" />

  % if 'robots' in config:
    <meta name='robots' content='${config.robots}' />
  % endif

  <title>${config.title}</title>
  
  <!-- Google Tag Manager -->
  <script>(function(w,d,s,l,i){w[l]=w[l]||[];w[l].push({'gtm.start':
  new Date().getTime(),event:'gtm.js'});var f=d.getElementsByTagName(s)[0],
  j=d.createElement(s),dl=l!='dataLayer'?'&l='+l:'';j.async=true;j.src=
  'https://www.googletagmanager.com/gtm.js?id='+i+dl;f.parentNode.insertBefore(j,f);
  })(window,document,'script','dataLayer','GTM-T65P98V6');</script>
  <!-- End Google Tag Manager -->

  <!-- Links -->
  <link rel="stylesheet" href="style.css">


<!-- Favicons -->
<link rel="apple-touch-icon" sizes="180x180" href="/apple-touch-icon.png">
<link rel="icon" type="image/png" sizes="32x32" href="/favicon-32x32.png">
<link rel="icon" type="image/png" sizes="16x16" href="/favicon-16x16.png">
<link rel="manifest" href="/site.webmanifest">
<link rel="mask-icon" href="/safari-pinned-tab.svg" color="#174754">
<meta name="msapplication-TileColor" content="#2b5797">
<meta name="theme-color" content="#ffffff">

<!-- Styles & Scripts -->
  <style>
    html {
        background:
          linear-gradient(
            rgba(0, 0, 0, ${config.background_opacity}),
            rgba(0, 0, 0, ${config.background_opacity})
          ),
          url('${config.background}'),
          rgba(0,0,0);
    }
  </style>
  <script src="https://kit.fontawesome.com/6bee25835f.js" crossorigin="anonymous"></script>
</head>

<body>
  <!-- Google Tag Manager (noscript) -->
  <noscript><iframe src="https://www.googletagmanager.com/ns.html?id=GTM-T65P98V6"
  height="0" width="0" style="display:none;visibility:hidden"></iframe></noscript>
  <!-- End Google Tag Manager (noscript) -->

  <a class="profilePicture">
    <img src="${config.avatar}" alt="Profile Picture" >
  </a>
 
  <div class="userName">
    ${config.name}
    % if 'pronunciation' in config:
    <i class="fa-solid fa-volume-high pointer pronunciation" onclick="playsound()"></i>
    <audio id="audio" style="display:none" src="${config.pronunciation}" ></audio>
    <script>
      function playsound() {
          var audio = document.getElementById("audio");
          audio.play();
      }
    </script>
    % endif
  </div>
  % if 'pronouns' in config:
  <div class="pronouns">
    ${config.pronouns}
  </div>
  % endif
  <div class="description">
    ${config.description}
  </div>
  % for section in links:
    <div id="${section.title}" class="sectionTitle">
      ${section.title}
    </div>
    <div class="links">
      % for link in section.links:
        % if 'href' in link and 'copy' in link:
          <a class="link"
          % if 'more' in link:
          ${link.more}
          % endif
          href="${link.href if 'wrap' not in link else link.wrap+'.html'}" target="_blank">
            <div class="tooltip hidden min">
              <i class="fa-solid fa-copy"></i>
            </div>
            <div class="inline-block">
              <i class="${link.icon}"></i> ${link.text}
              % if 'info' in link:
              <div class="info">${link.info}</div>
              % endif
            </div>
            <div class="tooltip min">
              <span class="" href="#" onclick="copytext('${link.copy}','${link._id}')" onmouseout="outFunc('${link._id}')">
                <span class="tooltiptext-left" id="${link._id}">Copy to clipboard</span>
                <i class="fa-solid fa-copy"></i>
              </span>
            </div>
          </a>
        % elif 'href' in link:
        <a class="link"
        % if 'more' in link:
        ${link.more}
        % endif
        href="${link.href if 'wrap' not in link else link.wrap+'.html'}" target="_blank">
          <i class="${link.icon}"></i> ${link.text}
          % if 'info' in link:
          <div class="info">${link.info}</div>
          % endif
        </a>
        % elif 'copy' in link:
        <div class="tooltip block">
        <a class="link" href="#" onclick="copytext('${link.copy}','${link._id}')" onmouseout="outFunc('${link._id}')">
          <span class="tooltiptext" id="${link._id}">Copy to clipboard</span>
          <i class="${link.icon}"></i> ${link.text}
        </a>
        </div>
        % endif
      % endfor
    </div>
  % endfor

  <footer>
    % if 'qrcode' in config:
    <div class="qrcode"><img src="${config.qrcode}" alt="Contact QR code" width="250px" height="250px" /></div>
    % endif
    <div class="footer">Last updated: ${metadata.last_updated}</div>
  </footer>

</body>
<script>
  function copytext(val, linkid) {
    event.preventDefault();
    console.log(val);
    navigator.clipboard.writeText(val);
    var tooltip = document.getElementById(linkid);
    tooltip.innerHTML = "Copied: " + val;
  }

  function outFunc(linkid) {
    var tooltip = document.getElementById(linkid);
    tooltip.innerHTML = "Copy to clipboard";
  }
</script>
</html>

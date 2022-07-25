	window.getAllList = [];
	window.getAllLength = 0;
	window.updateList = [];
	window.updateListLength = 0;
	window.sectionExtentD = new Array();
	window.sectionExtentI = new Array();
	window.sectionExtentU = new Array();
	window.sectionExtentR = new Array();
	window.subsectionExtentD = new Array();
	window.subsectionExtentI = new Array();
	window.subsectionExtentU = new Array();
	window.subsectionExtentR = new Array();
	function query(itemid, sid, ssid, author, title, available, url) {
		var myProject = window.Project;
		var imid = 'button' + itemid;
		var res = myProject.askInterfaceForLocalVersion(author, title, available);
		var buttontext = 'DOWNLOAD';
		var buttonclass = 'buttons uninstalled';
		if (res == '!') {
			buttontext = 'BUILT IN'; buttonclass = 'buttons builtin';
			window.sectionExtentI[sid]++;
			window.subsectionExtentI[ssid]++;
		}
		if (res == '=') {
			buttontext = 'INSTALLED'; buttonclass = 'buttons installed';
			window.sectionExtentI[sid]++;
			window.subsectionExtentI[ssid]++;
		}
		if (res == '<') {
			var loc = myProject.askInterfaceForLocalVersionText(author, title);
			buttontext = 'UPDATE ' + loc + ' &#9654 ' + available;
			buttonclass = 'buttons update';
			window.updateList.push(itemid);
			window.updateList.push(url);
			window.updateList.push(title + ' by ' + author);
			window.updateListLength = window.updateListLength + 1;
			window.sectionExtentU[sid]++;
			window.subsectionExtentU[ssid]++;
		}
		if (res == '>') {
			var loc = myProject.askInterfaceForLocalVersionText(author, title);
			buttontext = 'REVERT TO LIBRARY VERSION (' + loc + ' &#9654 ' + available + ')';
			buttonclass = 'buttons revert';
			window.sectionExtentR[sid]++;
			window.subsectionExtentR[ssid]++;
		}
		if (buttontext == 'DOWNLOAD') {
			window.getAllList.push(itemid);
			window.getAllList.push(url);
			window.getAllList.push(title + ' by ' + author);
			window.getAllLength = window.getAllLength + 1;
			window.sectionExtentD[sid]++;
			window.subsectionExtentD[ssid]++;
		}
		document.getElementById(imid).innerHTML = buttontext;
		document.getElementById(imid).className = buttonclass;
	}
	function onLoaded() {
		resetCounts(0);
	}
	window.onload=onLoaded;
	function addToIndicator(existing, count, className) {
		if (count == 0) return existing;
		if (existing != '') existing = existing + '+';
		return existing + '<span class="minibuttons ' + className + '">' + count + '</span>';
	}
	function setIndicatorForSection(sid) {
		var temp = addToIndicator('', window.sectionExtentI[sid], 'installed');
		temp = addToIndicator(temp, window.sectionExtentD[sid], 'uninstalled');
		temp = addToIndicator(temp, window.sectionExtentU[sid], 'update');
		temp = addToIndicator(temp, window.sectionExtentR[sid], 'revert');
		document.getElementById('sectionindicator'+sid).innerHTML = temp;
	}
	function setIndicatorForSubsection(sid) {
		var temp = addToIndicator('', window.subsectionExtentI[sid], 'installed');
		temp = addToIndicator(temp, window.subsectionExtentD[sid], 'uninstalled');
		temp = addToIndicator(temp, window.subsectionExtentU[sid], 'update');
		temp = addToIndicator(temp, window.subsectionExtentR[sid], 'revert');
		document.getElementById('subsectionindicator'+sid).innerHTML = temp;
	}
	function openSection(sid) {
		document.getElementById('sectionitems'+sid).className = 'sectionitemsopen';
		document.getElementById('sectionindicator'+sid).innerHTML = '';
	}
	function closeSection(sid) {
		document.getElementById('sectionitems'+sid).className = 'sectionitemsclosed';
		setIndicatorForSection(sid);
	}
	function maybeCloseSection(sid, updating) {
		if ((updating == 1) && (document.getElementById('sectionitems'+sid).className != 'sectionitemsclosed')) {
			return;
		}
		document.getElementById('sectionitems'+sid).className = 'sectionitemsclosed';
		setIndicatorForSection(sid);
	}
	function toggleSection(sid) {
		if (document.getElementById('sectionitems'+sid).className == 'sectionitemsclosed') {
			openSection(sid);
		} else {
			closeSection(sid);
		}
	}
	function openSubsection(ssid) {
		document.getElementById('subsectionitems'+ssid).className = 'sectionitemsopen';
		document.getElementById('subsectionindicator'+ssid).innerHTML = '';
	}
	function closeSubsection(ssid) {
		document.getElementById('subsectionitems'+ssid).className = 'sectionitemsclosed';
		setIndicatorForSubsection(ssid);
	}
	function maybeCloseSubsection(ssid, updating) {
		if ((updating == 1) && (document.getElementById('subsectionitems'+ssid).className != 'sectionitemsclosed')) {
			return;
		}
		document.getElementById('subsectionitems'+ssid).className = 'sectionitemsclosed';
		setIndicatorForSubsection(ssid);
	}
	function toggleSubsection(ssid) {
		if (document.getElementById('subsectionitems'+ssid).className == 'sectionitemsclosed') {
			openSubsection(ssid);
		} else {
			closeSubsection(ssid);
		}
	}
	function updateButtonLabels() {
		if (window.getAllLength == 0) {
			document.getElementById('getall').innerHTML = 'ALL DOWNLOADED';
			document.getElementById('getall').className = 'buttons installed';
		} else {
			if (window.getAllLength == 1) {
				document.getElementById('getall').innerHTML = 'DOWNLOAD 1 EXTENSION';
			} else {
				document.getElementById('getall').innerHTML = 'DOWNLOAD ' + window.getAllLength + ' EXTENSIONS';
			}
			document.getElementById('getall').className = 'buttons uninstalled';
		}
		if (window.updateListLength == 0) {
			document.getElementById('updateall').innerHTML = 'ALL UP TO DATE';
			document.getElementById('updateall').className = 'buttons installed';
		} else {
			if (window.updateListLength == 1) {
				document.getElementById('updateall').innerHTML = 'UPDATE 1 EXTENSION';
			} else {
				document.getElementById('updateall').innerHTML = 'UPDATE ' + window.updateListLength + ' EXTENSIONS';
			}
			document.getElementById('updateall').className = 'buttons update';
		}
	}
	function clearSectionExtents(sid) {
		window.sectionExtentI[sid] = 0;
		window.sectionExtentD[sid] = 0;
		window.sectionExtentU[sid] = 0;
		window.sectionExtentR[sid] = 0;
	}
	function clearSubsectionExtents(ssid) {
		window.subsectionExtentI[ssid] = 0;
		window.subsectionExtentD[ssid] = 0;
		window.subsectionExtentU[ssid] = 0;
		window.subsectionExtentR[ssid] = 0;
	}
	function resetCounts(updating) {
		clearExtents();
		setupResources();
		maybeCloseSubsections(updating);
		updateButtonLabels();
	}

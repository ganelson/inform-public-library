	function setupResources() \{
		{resources in: ALL}
		query({ID},
			{section of: {ID}},
			{subsection of: {ID}},
			'{author of: {ID} escape: quotes}',
			'{title of: {ID} escape: quotes}',
			'Version {version of: {ID}}',
			'library:/resources/Extensions/{author of: {ID} escape: both}/{title of: {ID} escape: both}.i7x?id={ID}');
		{end-resources}
	\}
	function downloadSucceeded(itemid) \{
		{resources in: ALL}
		if (itemid == {ID}) \{ openSection({section of: {ID}}); openSubsection({subsection of: {ID}}); \}
		{end-resources}
		resetCounts(1);
	\}
	function clearExtents() \{
		{sections}
		clearSectionExtents({SECTIONID});
		{subsections in: {SECTIONID}}
		clearSubsectionExtents({SUBSECTIONID});
		{end-subsections}
		{end-sections}
	\}
	function maybeCloseSubsections(updating) \{
		{sections}
		maybeCloseSection({SECTIONID}, updating);
		{subsections in: {SECTIONID}}
		maybeCloseSubsection({SUBSECTIONID}, updating);
		{end-subsections}
		{end-sections}
	\}
	function showJustHeadings() \{
		{sections}
		closeSection({SECTIONID});
		{end-sections}
	\}
	function showHeadingsAndSubheadings() \{
		{sections}
		openSection({SECTIONID});
		{subsections in: {SECTIONID}}
		closeSubsection({SUBSECTIONID});
		{end-subsections}
		{end-sections}
	\}
	function showEverything() \{
		{sections}
		openSection({SECTIONID});
		{subsections in: {SECTIONID}}
		openSubsection({SUBSECTIONID});
		{end-subsections}
		{end-sections}
	\}

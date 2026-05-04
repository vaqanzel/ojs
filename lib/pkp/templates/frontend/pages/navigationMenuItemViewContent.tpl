{**
 * frontend/pages/navigationMenuItemViewContent.tpl
 *
 * Copyright (c) 2014-2021 Simon Fraser University
 * Copyright (c) 2003-2021 John Willinsky
 * Distributed under the GNU GPL v3. For full terms see the file docs/COPYING.
 *
 * Display NavigationMenuItem content
 *}
{include file="frontend/components/header.tpl" pageTitleTranslated=$title}

{**
 * Include CSS untuk custom styling halaman
 *}
<link rel="stylesheet" href="{$baseUrl}/styles/reviewer-guidelines.css" type="text/css" />
<link rel="stylesheet" href="{$baseUrl}/styles/reviewer-guideline-header.css" type="text/css" />

{include file="frontend/components/breadcrumbs.tpl" currentTitle=$title}

{**
 * Deteksi jika URL atau title mengandung 'reviewer-guideline'
 * Jika ya, tampilkan header khusus untuk Reviewer Guideline
 *}
{assign var="isReviewerGuideline" value=false}
{if $navigationMenuItem && $navigationMenuItem->getPath()}
	{assign var="pagePath" value=$navigationMenuItem->getPath()}
	{if 'reviewer-guideline'|strpos:$pagePath !== false || 'reviewer-guideline'|strpos:$title !== false}
		{assign var="isReviewerGuideline" value=true}
	{/if}
{/if}

<div class="page {if $isReviewerGuideline}page_reviewer_guideline{/if}">
	{if $isReviewerGuideline}
		{**
		 * Custom header untuk halaman Reviewer Guideline
		 * Menampilkan badge/informasi di atas konten utama
		 *}
		<div class="page-header-special-reviewer-guideline">
			<div class="reviewer-guideline-badge">
				<span class="badge-icon">📋</span>
				<span class="badge-text">Reviewer Guidelines</span>
			</div>
		</div>
	{/if}

	<h1 class="page_title">{$title|escape}</h1>
	{$content}
</div>

{include file="frontend/components/footer.tpl"}

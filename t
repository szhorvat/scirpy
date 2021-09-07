
[34mdocs/tutorials/tutorial_3k_tcr.md[0m
[34m─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────[0m

[34m────────────[0m[34m┐[0m
[34m6[0m: [38;2;255;255;255mjupyter: [0m[34m│[0m
[34m────────────[0m[34m┘[0m
[38;2;174;129;255m    text_representation:[0m
[38;2;174;129;255m      extension: .md[0m
[38;2;174;129;255m      format_name: markdown[0m
[48;2;52;0;1m      format_version: '1.[48;2;144;16;17m2[48;2;52;0;1m'[0m[48;2;52;0;1m[0K[0m
[48;2;52;0;1m      jupytext_version: 1.[48;2;144;16;17m5[48;2;52;0;1m.[48;2;144;16;17m0.rc1[0m[48;2;52;0;1m[0K[0m
[48;2;1;40;0;38;2;174;129;255m      format_version: '1.[48;2;0;96;0m3[48;2;1;40;0m'[0m[48;2;1;40;0m[0K[0m
[48;2;1;40;0;38;2;174;129;255m      jupytext_version: 1.[48;2;0;96;0m11[48;2;1;40;0m.[48;2;0;96;0m4[0m[48;2;1;40;0m[0K[0m
[38;2;255;255;255m---[0m

[38;2;253;151;31m# Analysis of 3k T cells from cancer[0m

[34m─────────────────────────────────────────────[0m[34m┐[0m
[34m98[0m: [38;2;255;255;255msc.pp.filter_cells(adata, min_genes=100) [0m[34m│[0m
[34m─────────────────────────────────────────────[0m[34m┘[0m
[38;2;255;255;255m```[38;2;190;132;255mpython[0m
[38;2;255;255;255msc.pp.normalize_per_cell(adata, [38;2;253;151;31mcounts_per_cell_after[38;2;249;38;114m=[38;2;190;132;255m1000[38;2;255;255;255m)[0m
[38;2;255;255;255msc.pp.log1p(adata)[0m
[48;2;1;40;0;38;2;255;255;255msc.tl.pca(adata)[0m[48;2;1;40;0m[0K[0m
[48;2;1;40;0;38;2;255;255;255msc.pp.neighbors(adata)[0m[48;2;1;40;0m[0K[0m
[38;2;255;255;255m```[0m

[38;2;255;255;255mFor the [38;2;228;46;112m_Wu2020_[38;2;255;255;255m dataset, the authors already provide clusters and UMAP coordinates.[0m

[34m───────────────────────────────[0m[34m┐[0m
[34m623[0m: [38;2;255;255;255mir.pl.repertoire_overlap( [0m[34m│[0m
[34m───────────────────────────────[0m[34m┘[0m

[38;2;253;151;31m### Clonotypes preferentially occuring in a group[0m

[48;2;1;40;0;38;2;255;255;255m```[38;2;190;132;255mpython[0m[48;2;1;40;0m[0K[0m
[48;2;1;40;0;38;2;255;255;255mir.tl.clonotype_modularity(adata, [38;2;253;151;31mtarget_col[38;2;249;38;114m=[38;2;230;219;116m"cc_aa_alignment"[38;2;255;255;255m)[0m[48;2;1;40;0m[0K[0m
[48;2;1;40;0;38;2;255;255;255m```[0m[48;2;1;40;0m[0K[0m
[48;2;1;40;0m[0K[0m
[48;2;1;40;0;38;2;255;255;255m```[38;2;190;132;255mpython[0m[48;2;1;40;0m[0K[0m
[48;2;1;40;0;38;2;255;255;255mir.pl.clonotype_modularity(adata)[0m[48;2;1;40;0m[0K[0m
[48;2;1;40;0;38;2;255;255;255m```[0m[48;2;1;40;0m[0K[0m
[48;2;1;40;0m[0K[0m
[48;2;1;40;0;38;2;255;255;255m```[38;2;190;132;255mpython[0m[48;2;1;40;0m[0K[0m
[48;2;1;40;0;38;2;255;255;255msc.pl.umap(adata, [38;2;253;151;31mcolor[38;2;249;38;114m=[38;2;230;219;116m"clonotype_modularity"[38;2;255;255;255m)[0m[48;2;1;40;0m[0K[0m
[48;2;1;40;0;38;2;255;255;255m```[0m[48;2;1;40;0m[0K[0m
[48;2;1;40;0m[0K[0m
[48;2;1;40;0;38;2;255;255;255m```[38;2;190;132;255mpython[0m[48;2;1;40;0m[0K[0m
[48;2;1;40;0;38;2;255;255;255mconnected_clonotypes [38;2;249;38;114m=[38;2;255;255;255madata.obs.loc[adata.obs[[38;2;230;219;116m"clonotype_modularity"[38;2;255;255;255m] [38;2;249;38;114m>[38;2;255;255;255m [38;2;190;132;255m4[38;2;255;255;255m, [38;2;230;219;116m"cc_aa_alignment"[38;2;255;255;255m].unique()[0m[48;2;1;40;0m[0K[0m
[48;2;1;40;0;38;2;255;255;255m```[0m[48;2;1;40;0m[0K[0m
[48;2;1;40;0m[0K[0m
[48;2;1;40;0;38;2;255;255;255m```[38;2;190;132;255mpython[0m[48;2;1;40;0m[0K[0m
[48;2;1;40;0;38;2;255;255;255msc.pl.umap(adata, [38;2;253;151;31mcolor[38;2;249;38;114m=[38;2;230;219;116m"cc_aa_alignment"[38;2;255;255;255m, [38;2;253;151;31mgroups[38;2;249;38;114m=[38;2;255;255;255mconnected_clonotypes, [38;2;253;151;31mpalette[38;2;249;38;114m=[38;2;255;255;255mcycler([38;2;253;151;31mcolor[38;2;249;38;114m=[38;2;255;255;255mmpl_cm.Dark2_r.colors))[0m[48;2;1;40;0m[0K[0m
[48;2;1;40;0;38;2;255;255;255m```[0m[48;2;1;40;0m[0K[0m
[48;2;1;40;0m[0K[0m
[38;2;124;120;101m<!-- #raw raw_mimetype="text/restructuredtext" -->[0m
[38;2;255;255;255mClonotypes associated with an experimental group (a given cell type, samle or diagnosis) might be important candidates as biomarkers or disease drivers. Scirpy offers :func:[38;2;236;53;51m`~scirpy.tl.clonotype_imbalance`[38;2;255;255;255m to rank clonotypes based on Fisher's exact test comparing the fractional presence of a given clonotype in two groups.[0m
[38;2;124;120;101m<!-- #endraw -->[0m
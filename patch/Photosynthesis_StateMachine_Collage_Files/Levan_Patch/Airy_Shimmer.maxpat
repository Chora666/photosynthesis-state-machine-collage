{
	"patcher" : 	{
		"fileversion" : 1,
		"appversion" : 		{
			"major" : 9,
			"minor" : 0,
			"revision" : 8,
			"architecture" : "x64",
			"modernui" : 1
		}
,
		"classnamespace" : "box",
		"rect" : [ 252.0, 143.0, 1000.0, 730.0 ],
		"gridsize" : [ 15.0, 15.0 ],
		"boxes" : [ 			{
				"box" : 				{
					"comment" : "",
					"id" : "obj-3",
					"index" : 1,
					"maxclass" : "outlet",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 323.0, 608.0, 30.0, 30.0 ]
				}

			}
, 			{
				"box" : 				{
					"comment" : "",
					"id" : "obj-2",
					"index" : 2,
					"maxclass" : "inlet",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 476.0, 68.0, 30.0, 30.0 ]
				}

			}
, 			{
				"box" : 				{
					"comment" : "",
					"id" : "obj-4",
					"index" : 1,
					"maxclass" : "inlet",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 255.0, 60.0, 30.0, 30.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-1920",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 176.0, 24.0, 69.54525101184845, 20.0 ],
					"text" : "pitch"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-1918",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 432.227374494075775, 28.0, 69.54525101184845, 20.0 ],
					"text" : "Brightness"
				}

			}
, 			{
				"box" : 				{
					"format" : 6,
					"id" : "obj-1916",
					"maxclass" : "flonum",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 408.0, 472.0, 50.0, 22.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-1914",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "float" ],
					"patching_rect" : [ 408.0, 437.0, 39.0, 22.0 ],
					"text" : "/ 100."
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-1913",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"patching_rect" : [ 408.0, 410.0, 32.0, 22.0 ],
					"text" : "+ 80"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-1912",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 408.0, 382.0, 66.0, 22.0 ],
					"text" : "random 20"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-1911",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 249.0, 494.0, 30.0, 22.0 ],
					"text" : "*~ 1"
				}

			}
, 			{
				"box" : 				{
					"fontface" : 0,
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"id" : "obj-1909",
					"maxclass" : "number~",
					"mode" : 2,
					"numinlets" : 2,
					"numoutlets" : 2,
					"outlettype" : [ "signal", "float" ],
					"patching_rect" : [ 176.0, 595.0, 56.0, 22.0 ],
					"sig" : 0.0
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-1874",
					"maxclass" : "newobj",
					"numinlets" : 3,
					"numoutlets" : 2,
					"outlettype" : [ "", "bang" ],
					"patching_rect" : [ 342.0, 417.0, 44.0, 22.0 ],
					"text" : "line 10"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-1868",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 249.0, 532.0, 40.0, 22.0 ],
					"text" : "*~ 0.3"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-1865",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 337.0, 172.0, 35.0, 22.0 ],
					"text" : "clear"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-1866",
					"maxclass" : "button",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 282.0, 146.0, 35.106382727622986, 35.106382727622986 ]
				}

			}
, 			{
				"box" : 				{
					"addpoints" : [ 0.0, 0.0, 0, 25.665542388215979, 1.0, 0, 111.535214204737485, 0.865590328375498, 0, 149.699512789858147, 0.016561899185181, 0 ],
					"classic_curve" : 1,
					"id" : "obj-1867",
					"maxclass" : "function",
					"numinlets" : 1,
					"numoutlets" : 4,
					"outlettype" : [ "float", "", "", "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 282.0, 205.0, 200.0, 100.0 ],
					"varname" : "function[1]"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-1860",
					"maxclass" : "newobj",
					"numinlets" : 3,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 249.0, 449.0, 112.0, 22.0 ],
					"text" : "Airy_Shimmer_Pad"
				}

			}
 ],
		"lines" : [ 			{
				"patchline" : 				{
					"destination" : [ "obj-1911", 0 ],
					"source" : [ "obj-1860", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-1867", 0 ],
					"source" : [ "obj-1865", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-1867", 0 ],
					"order" : 1,
					"source" : [ "obj-1866", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-1912", 0 ],
					"order" : 0,
					"source" : [ "obj-1866", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-1874", 0 ],
					"source" : [ "obj-1867", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-1909", 0 ],
					"order" : 1,
					"source" : [ "obj-1868", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-3", 0 ],
					"order" : 0,
					"source" : [ "obj-1868", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-1860", 2 ],
					"source" : [ "obj-1874", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-1868", 0 ],
					"source" : [ "obj-1911", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-1913", 0 ],
					"source" : [ "obj-1912", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-1914", 0 ],
					"source" : [ "obj-1913", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-1911", 1 ],
					"order" : 1,
					"source" : [ "obj-1914", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-1916", 0 ],
					"order" : 0,
					"source" : [ "obj-1914", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-1860", 1 ],
					"source" : [ "obj-2", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-1860", 0 ],
					"order" : 1,
					"source" : [ "obj-4", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-1866", 0 ],
					"order" : 0,
					"source" : [ "obj-4", 0 ]
				}

			}
 ]
	}

}

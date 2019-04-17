# ZigZagNet: Fusing Top-Down and Bottom-Up Context for Object Segmentation

by Di Lin, Dingguo Shen, Siting Shen,Yuanfeng Ji,Dani Lischinski,Daniel Cohen-Or,Hui Huang

## Introduction

This repository re-implements ZigZagNet on the base of [Detectron](https://github.com/facebookresearch/Detectron). Very consistent gains are available for all tested models, regardless of baseline strength.

Please follow [Detectron](https://github.com/facebookresearch/Detectron) on how to install and use ZigZagNet.


## Citation

If you use our code/model/data, please cite our paper:

```
@inproceedings{cai18cascadercnn,
  author = {Di Lin, Dingguo Shen, Siting Shen,Yuanfeng Ji,Dani Lischinski,Daniel Cohen-Or,Hui Huang},
  Title = {ZigZagNet: Fusing Top-Down and Bottom-Up Context for Object Segmentation},
  booktitle = {CVPR},
  Year  = {2019}
}
```

and Detectron:

```
@misc{Detectron2018,
  author =       {Ross Girshick and Ilija Radosavovic and Georgia Gkioxari and
                  Piotr Doll\'{a}r and Kaiming He},
  title =        {Detectron},
  howpublished = {\url{https://github.com/facebookresearch/detectron}},
  year =         {2018}
}
```

## Benchmarking


### End-to-End Mask R-CNN Baselines

All models were tested on the `coco_2017_val` dataset

<table align="canter"><tbody>
<!-- START E2E FASTER AND MASK TABLE -->
<!-- TABLE HEADER -->
<!-- Info: we use wrap text in <sup><sub></sub><sup> to make is small -->
<th valign="bottom"><sup><sub>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;backbone&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</sub></sup></th>
<th valign="bottom"><sup><sub>type</sub></sup></th>
<th valign="bottom"><sup><sub>lr<br/>schd</sub></sup></th>
<th valign="bottom"><sup><sub>im/<br/>gpu</sub></sup></th>
<th valign="bottom"><sup><sub>box<br/>AP</sub></sup></th>
<th valign="bottom"><sup><sub>box<br/>AP50</sub></sup></th>
<th valign="bottom"><sup><sub>box<br/>AP75</sub></sup></th>
<th valign="bottom"><sup><sub>mask<br/>AP</sub></sup></th>
<th valign="bottom"><sup><sub>mask<br/>AP50</sub></sup></th>
<th valign="bottom"><sup><sub>mask<br/>AP75</sub></sup></th>
<!-- TABLE BODY -->

<tr>
<td align="left"><sup><sub>X-101-64x4d-FPN-baseline</sub></sup></td>
<td align="left"><sup><sub>Mask</sub></sup></td>
<td align="left"><sup><sub>1x</sub></sup></td>
<td align="right"><sup><sub>1</sub></sup></td>
<td align="right"><sup><sub>42.38</sub></sup></td>
<td align="right"><sup><sub>64.3</sub></sup></td>
<td align="right"><sup><sub>46.41</sub></sup></td>
<td align="right"><sup><sub>37.53</sub></sup></td>
<td align="right"><sup><sub>60.63</sub></sup></td>
<td align="right"><sup><sub>39.85</sub></sup></td>
</tr>
<tr>
<td align="left"><sup><sub>X-101-64x4d-FPN-ZZNet</sub></sup></td>
<td align="left"><sup><sub>Mask</sub></sup></td>
<td align="left"><sup><sub>1x</sub></sup></td>
<td align="right"><sup><sub>1</sub></sup></td>
<td align="right"><sup><sub>44.57</sub></sup></td>
<td align="right"><sup><sub>66.66</sub></sup></td>
<td align="right"><sup><sub>48.68</sub></sup></td>
<td align="right"><sup><sub>39.59</sub></sup></td>
<td align="right"><sup><sub>63.49</sub></sup></td>
<td align="right"><sup><sub>41.96</sub></sup></td>
</tr>

<tr>
<td align="left"><sup><sub>X-152-32x8d-FPN-baseline</sub></sup></td>
<td align="left"><sup><sub>Mask</sub></sup></td>
<td align="left"><sup><sub>1x</sub></sup></td>
<td align="right"><sup><sub>1</sub></sup></td>
<td align="right"><sup><sub>45.30</sub></sup></td>
<td align="right"><sup><sub>66.85</sub></sup></td>
<td align="right"><sup><sub>49.85</sub></sup></td>
<td align="right"><sup><sub>39.75</sub></sup></td>
<td align="right"><sup><sub>63.54</sub></sup></td>
<td align="right"><sup><sub>42.25</sub></sup></td>
</tr>
<tr>
<td align="left"><sup><sub>X-152-32x8d-FPN-ZZNet</sub></sup></td>
<td align="left"><sup><sub>Mask</sub></sup></td>
<td align="left"><sup><sub>1x</sub></sup></td>
<td align="right"><sup><sub>1</sub></sup></td>
<td align="right"><sup><sub>46.44</sub></sup></td>
<td align="right"><sup><sub>67.69</sub></sup></td>
<td align="right"><sup><sub>51.15</sub></sup></td>
<td align="right"><sup><sub>40.96</sub></sup></td>
<td align="right"><sup><sub>64.88</sub></sup></td>
<td align="right"><sup><sub>43.66</sub></sup></td>
</tr>
<!-- END E2E FASTER AND MASK TABLE -->
</tbody></table>

## Model
The model weights that can reproduce numbers in our paper will be coming soon.




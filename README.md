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

### End-to-End Faster & Mask R-CNN Baselines

<table><tbody>
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
<th valign="bottom"><sup><sub>download<br/>links</sub></sup></th>
<!-- TABLE BODY -->

<tr>
<td align="left"><sup><sub>X-101-64x4d-FPN-baseline</sub></sup></td>
<td align="left"><sup><sub>Faster</sub></sup></td>
<td align="left"><sup><sub>1x</sub></sup></td>
<td align="right"><sup><sub>1</sub></sup></td>
<td align="right"><sup><sub>41.5</sub></sup></td>
<td align="right"><sup><sub>63.8</sub></sup></td>
<td align="right"><sup><sub>44.9</sub></sup></td>
<td align="right"><sup><sub>-</sub></sup></td>
<td align="right"><sup><sub>-</sub></sup></td>
<td align="right"><sup><sub>-</sub></sup></td>
<td align="left"><sup><sub><a href="https://s3-us-west-2.amazonaws.com/detectron/35858015/12_2017_baselines/e2e_faster_rcnn_X-101-64x4d-FPN_1x.yaml.01_40_54.1xc565DE/output/train/coco_2014_train%3Acoco_2014_valminusminival/generalized_rcnn/model_final.pkl">model</a>&nbsp;|&nbsp;<a href="https://s3-us-west-2.amazonaws.com/detectron/35858015/12_2017_baselines/e2e_faster_rcnn_X-101-64x4d-FPN_1x.yaml.01_40_54.1xc565DE/output/test/coco_2014_minival/generalized_rcnn/bbox_coco_2014_minival_results.json">boxes</a></sub></sup></td>
</tr>
<tr>
<td align="left"><sup><sub>X-101-64x4d-FPN-ZZNet</sub></sup></td>
<td align="left"><sup><sub>Faster</sub></sup></td>
<td align="left"><sup><sub>1x</sub></sup></td>
<td align="right"><sup><sub>1</sub></sup></td>
<td align="right"><sup><sub>45.4</sub></sup></td>
<td align="right"><sup><sub>64.0</sub></sup></td>
<td align="right"><sup><sub>49.8</sub></sup></td>
<td align="right"><sup><sub>-</sub></sup></td>
<td align="right"><sup><sub>-</sub></sup></td>
<td align="right"><sup><sub>-</sub></sup></td>
<td align="left"><sup><sub>model</a>&nbsp;|&nbsp;<a href="http://www.svcl.ucsd.edu/projects/cascade-rcnn/results/bbox_coco_2014_minival_results_X101-64x4d-FPN-cascade-rcnn.json">boxes</a></sub></sup></td>
</tr>
<tr>
<td align="left"><sup><sub>X-101-64x4d-FPN-baseline</sub></sup></td>
<td align="left"><sup><sub>Mask</sub></sup></td>
<td align="left"><sup><sub>1x</sub></sup></td>
<td align="right"><sup><sub>1</sub></sup></td>
<td align="right"><sup><sub>42.4</sub></sup></td>
<td align="right"><sup><sub>64.3</sub></sup></td>
<td align="right"><sup><sub>46.4</sub></sup></td>
<td align="right"><sup><sub>37.5</sub></sup></td>
<td align="right"><sup><sub>60.6</sub></sup></td>
<td align="right"><sup><sub>39.9</sub></sup></td>
<td align="left"><sup><sub><a href="https://s3-us-west-2.amazonaws.com/detectron/36494496/12_2017_baselines/e2e_mask_rcnn_X-101-64x4d-FPN_1x.yaml.07_50_11.fkwVtEvg/output/train/coco_2014_train%3Acoco_2014_valminusminival/generalized_rcnn/model_final.pkl">model</a>&nbsp;|&nbsp;<a href="https://s3-us-west-2.amazonaws.com/detectron/36494496/12_2017_baselines/e2e_mask_rcnn_X-101-64x4d-FPN_1x.yaml.07_50_11.fkwVtEvg/output/test/coco_2014_minival/generalized_rcnn/bbox_coco_2014_minival_results.json">boxes</a>&nbsp;|&nbsp;<a href="https://s3-us-west-2.amazonaws.com/detectron/36494496/12_2017_baselines/e2e_mask_rcnn_X-101-64x4d-FPN_1x.yaml.07_50_11.fkwVtEvg/output/test/coco_2014_minival/generalized_rcnn/segmentations_coco_2014_minival_results.json">masks</a></sub></sup></td>
</tr>
<tr>
<td align="left"><sup><sub>X-101-64x4d-FPN-cascade</sub></sup></td>
<td align="left"><sup><sub>Mask</sub></sup></td>
<td align="left"><sup><sub>1x</sub></sup></td>
<td align="right"><sup><sub>1</sub></sup></td>
<td align="right"><sup><sub>45.9</sub></sup></td>
<td align="right"><sup><sub>64.4</sub></sup></td>
<td align="right"><sup><sub>50.2</sub></sup></td>
<td align="right"><sup><sub>38.8</sub></sup></td>
<td align="right"><sup><sub>61.3</sub></sup></td>
<td align="right"><sup><sub>41.6</sub></sup></td>
<td align="left"><sup><sub>model</a>&nbsp;|&nbsp;<a href="http://www.svcl.ucsd.edu/projects/cascade-rcnn/results/bbox_coco_2014_minival_results_X101-64x4d-FPN-cascade-rcnn-mask.json">boxes</a>&nbsp;|&nbsp;<a href="http://www.svcl.ucsd.edu/projects/cascade-rcnn/results/segmentations_coco_2014_minival_results_X101-64x4d-FPN-cascade-rcnn-mask.json">masks</a></sub></sup></td>
</tr>
<tr>
<td align="left"><sup><sub>X-101-32x8d-FPN-baseline</sub></sup></td>
<td align="left"><sup><sub>Mask</sub></sup></td>
<td align="left"><sup><sub>1x</sub></sup></td>
<td align="right"><sup><sub>1</sub></sup></td>
<td align="right"><sup><sub>42.1</sub></sup></td>
<td align="right"><sup><sub>64.1</sub></sup></td>
<td align="right"><sup><sub>45.9</sub></sup></td>
<td align="right"><sup><sub>37.3</sub></sup></td>
<td align="right"><sup><sub>60.3</sub></sup></td>
<td align="right"><sup><sub>39.5</sub></sup></td>
<td align="left"><sup><sub><a href="https://s3-us-west-2.amazonaws.com/detectron/36761843/12_2017_baselines/e2e_mask_rcnn_X-101-32x8d-FPN_1x.yaml.06_35_59.RZotkLKI/output/train/coco_2014_train%3Acoco_2014_valminusminival/generalized_rcnn/model_final.pkl">model</a>&nbsp;|&nbsp;<a href="https://s3-us-west-2.amazonaws.com/detectron/36761843/12_2017_baselines/e2e_mask_rcnn_X-101-32x8d-FPN_1x.yaml.06_35_59.RZotkLKI/output/test/coco_2014_minival/generalized_rcnn/bbox_coco_2014_minival_results.json">boxes</a>&nbsp;|&nbsp;<a href="https://s3-us-west-2.amazonaws.com/detectron/36761843/12_2017_baselines/e2e_mask_rcnn_X-101-32x8d-FPN_1x.yaml.06_35_59.RZotkLKI/output/test/coco_2014_minival/generalized_rcnn/segmentations_coco_2014_minival_results.json">masks</a></sub></sup></td>
</tr>
<tr>
<td align="left"><sup><sub>X-101-32x8d-FPN-cascade</sub></sup></td>
<td align="left"><sup><sub>Mask</sub></sup></td>
<td align="left"><sup><sub>1x</sub></sup></td>
<td align="right"><sup><sub>1</sub></sup></td>
<td align="right"><sup><sub>45.8</sub></sup></td>
<td align="right"><sup><sub>64.1</sub></sup></td>
<td align="right"><sup><sub>50.3</sub></sup></td>
<td align="right"><sup><sub>38.6</sub></sup></td>
<td align="right"><sup><sub>60.6</sub></sup></td>
<td align="right"><sup><sub>41.5</sub></sup></td>
<td align="left"><sup><sub>model</a>&nbsp;|&nbsp;<a href="http://www.svcl.ucsd.edu/projects/cascade-rcnn/results/bbox_coco_2014_minival_results_X101-32x8d-FPN-cascade-rcnn-mask.json">boxes</a>&nbsp;|&nbsp;<a href="http://www.svcl.ucsd.edu/projects/cascade-rcnn/results/segmentations_coco_2014_minival_results_X101-32x8d-FPN-cascade-rcnn-mask.json">masks</a></sub></sup></td>
</tr>
<!-- END E2E FASTER AND MASK TABLE -->
</tbody></table>






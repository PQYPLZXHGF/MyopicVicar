# Copyright 2017 Trustees of FreeBMD
# 
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
# 
# http://www.apache.org/licenses/LICENSE-2.0
# 
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
# 
module DonateIconHelper
  DONATE_OVERLAY = '<?xml version="1.0" encoding="UTF-8" standalone="no"?><!DOCTYPE svg PUBLIC "-//W3C//DTD SVG 1.1//EN" "http://www.w3.org/Graphics/SVG/1.1/DTD/svg11.dtd">
<svg width="100%" height="100%" viewBox="0 0 48 64" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" xml:space="preserve">
  <clipPath id="Clip2">
    <path d="M-0.161,51.919l0,-31.064l10.355,-5.177l18.12,9.06l13.807,-6.903l6.04,3.02l0,31.064l-24.161,12.081l-24.161,-12.081Z"/>
  </clipPath>
  <g clip-path="url(#Clip2)">
    <path id="C" d="M24,32.936l0,31.064l-24.161,-12.081l0,-31.064l24.161,12.081Z"/>
    <path id="B" d="M24,32.936l0,31.064l24.161,-12.081l0,-31.064l-24.161,12.081Z"/>
    <path id="A" d="M-0.161,20.855l24.161,-12.08l24.161,12.08l-24.161,12.081l-24.161,-12.081Z"/>
    <path id="Heart" d="M11.92,38.418c1.816,-2.563 5.449,-0.786 7.266,1.829c1.817,2.614 1.817,6.066 0,8.629c-1.272,1.966 -4.542,2.955 -7.266,3.348c-2.725,-3.059 -5.995,-7.247 -7.267,-10.458c-1.817,-4.34 -1.817,-7.792 0,-8.629c1.817,-0.837 5.45,0.94 7.267,5.281Z"/>
  </g>
</svg>'

  DONATE_COIN = '<?xml version="1.0" encoding="UTF-8" standalone="no"?><!DOCTYPE svg PUBLIC "-//W3C//DTD SVG 1.1//EN" "http://www.w3.org/Graphics/SVG/1.1/DTD/svg11.dtd">
<svg width="100%" height="100%" viewBox="0 0 48 64" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" xml:space="preserve">
  <path d="M24.468,0.633c3.07,1.527 5.562,5.332 5.562,8.492c0,1.521 -0.578,2.618 -1.52,3.175c-0.428,0.254 -1.383,0.76 -1.941,0.781c-0.765,0.027 -8.166,-11.369 -7.326,-11.955c0.348,-0.242 1.927,-1.134 2.78,-1.126c0.781,0.007 1.568,0.197 2.445,0.633Z" style="fill:#fce233;"/>
  <path d="M22.096,0.001l0.073,0.003l0.074,0.003l0.073,0.005l0.074,0.005l0.073,0.007l0.074,0.008l0.074,0.009l0.074,0.01l0.074,0.011l0.075,0.013l0.075,0.014l0.074,0.015l0.075,0.016l0.076,0.017l0.075,0.019l0.076,0.02l0.076,0.021l0.077,0.023l0.077,0.023l0.077,0.025l0.077,0.027l0.078,0.028l0.079,0.029l0.078,0.03l0.079,0.032l0.08,0.033l0.08,0.034l0.08,0.036l0.081,0.038l0.082,0.038l0.082,0.04l0.072,0.037l0.071,0.037l0.072,0.038l0.071,0.038l0.071,0.04l0.07,0.04l0.071,0.041l0.07,0.042l0.07,0.042l0.07,0.044l0.069,0.044l0.069,0.044l0.069,0.046l0.069,0.046l0.068,0.047l0.068,0.048l0.135,0.097l0.134,0.101l0.133,0.103l0.131,0.105l0.13,0.108l0.128,0.111l0.127,0.113l0.126,0.115l0.124,0.117l0.122,0.12l0.121,0.122l0.119,0.124l0.117,0.126l0.116,0.128l0.114,0.129l0.112,0.132l0.11,0.133l0.108,0.135l0.106,0.136l0.104,0.138l0.102,0.14l0.1,0.141l0.097,0.142l0.096,0.144l0.093,0.144l0.091,0.146l0.089,0.147l0.086,0.148l0.084,0.149l0.081,0.149l0.079,0.151l0.076,0.151l0.074,0.152l0.071,0.152l0.068,0.153l0.066,0.154l0.063,0.153l0.06,0.155l0.057,0.154l0.054,0.155l0.052,0.154l0.048,0.155l0.045,0.155l0.043,0.155l0.019,0.077l0.02,0.077l0.018,0.077l0.018,0.078l0.016,0.077l0.016,0.077l0.015,0.077l0.015,0.076l0.013,0.077l0.013,0.077l0.012,0.076l0.011,0.077l0.01,0.076l0.009,0.076l0.008,0.076l0.008,0.076l0.007,0.075l0.006,0.076l0.004,0.075l0.005,0.075l0.003,0.075l0.002,0.074l0.001,0.075l0.001,0.074l-0.001,0.071l-0.001,0.07l-0.002,0.07l-0.003,0.069l-0.004,0.069l-0.004,0.068l-0.006,0.067l-0.006,0.066l-0.007,0.066l-0.008,0.066l-0.008,0.064l-0.01,0.064l-0.01,0.064l-0.011,0.062l-0.012,0.062l-0.012,0.062l-0.013,0.06l-0.015,0.06l-0.014,0.06l-0.016,0.058l-0.016,0.058l-0.017,0.058l-0.018,0.056l-0.019,0.056l-0.019,0.056l-0.02,0.054l-0.021,0.054l-0.021,0.053l-0.022,0.053l-0.023,0.052l-0.024,0.051l-0.024,0.05l-0.025,0.05l-0.025,0.049l-0.027,0.048l-0.027,0.048l-0.027,0.047l-0.028,0.046l-0.029,0.045l-0.03,0.045l-0.03,0.044l-0.031,0.043l-0.032,0.043l-0.032,0.041l-0.033,0.041l-0.033,0.041l-0.034,0.039l-0.035,0.039l-0.035,0.038l-0.036,0.037l-0.037,0.037l-0.037,0.036l-0.037,0.035l-0.039,0.034l-0.038,0.034l-0.04,0.032l-0.04,0.032l-0.041,0.032l-0.041,0.03l-0.041,0.03l-0.043,0.028l-0.042,0.029l-0.044,0.027l-0.044,0.026l-0.086,0.051l-0.097,0.055l-0.107,0.059l-0.115,0.061l-0.122,0.064l-0.128,0.063l-0.132,0.064l-0.135,0.061l-0.068,0.03l-0.068,0.029l-0.068,0.028l-0.068,0.027l-0.068,0.025l-0.068,0.025l-0.067,0.023l-0.066,0.021l-0.065,0.019l-0.064,0.018l-0.062,0.015l-0.061,0.014l-0.06,0.011l-0.057,0.008l-0.056,0.006l-0.053,0.004l-0.01,-0.001l-0.009,-0.001l-0.011,-0.002l-0.011,-0.003l-0.024,-0.01l-0.026,-0.014l-0.028,-0.017l-0.031,-0.021l-0.033,-0.026l-0.035,-0.029l-0.037,-0.032l-0.039,-0.036l-0.041,-0.04l-0.043,-0.043l-0.045,-0.047l-0.047,-0.05l-0.049,-0.053l-0.05,-0.057l-0.106,-0.123l-0.113,-0.134l-0.119,-0.147l-0.125,-0.157l-0.131,-0.168l-0.136,-0.178l-0.141,-0.188l-0.146,-0.197l-0.15,-0.206l-0.153,-0.213l-0.158,-0.222l-0.161,-0.228l-0.163,-0.235l-0.166,-0.24l-0.169,-0.247l-0.17,-0.251l-0.172,-0.256l-0.173,-0.26l-0.174,-0.264l-0.174,-0.266l-0.175,-0.269l-0.174,-0.271l-0.174,-0.272l-0.173,-0.274l-0.172,-0.273l-0.17,-0.274l-0.169,-0.273l-0.166,-0.272l-0.164,-0.271l-0.161,-0.268l-0.158,-0.266l-0.154,-0.263l-0.15,-0.259l-0.146,-0.255l-0.142,-0.25l-0.136,-0.245l-0.132,-0.24l-0.125,-0.233l-0.12,-0.227l-0.114,-0.219l-0.106,-0.212l-0.1,-0.203l-0.093,-0.195l-0.043,-0.094l-0.042,-0.092l-0.039,-0.089l-0.038,-0.087l-0.035,-0.084l-0.033,-0.081l-0.031,-0.079l-0.029,-0.076l-0.027,-0.073l-0.024,-0.071l-0.022,-0.067l-0.02,-0.065l-0.017,-0.061l-0.015,-0.058l-0.012,-0.055l-0.009,-0.052l-0.007,-0.049l-0.005,-0.045l-0.002,-0.041l0.001,-0.038l0.002,-0.018l0.002,-0.017l0.003,-0.016l0.004,-0.015l0.004,-0.014l0.005,-0.013l0.006,-0.012l0.006,-0.011l0.007,-0.011l0.008,-0.009l0.009,-0.008l0.01,-0.008l0.036,-0.024l0.043,-0.028l0.049,-0.032l0.056,-0.034l0.128,-0.076l0.072,-0.042l0.077,-0.043l0.081,-0.045l0.085,-0.046l0.088,-0.047l0.092,-0.048l0.095,-0.048l0.097,-0.048l0.1,-0.048l0.101,-0.048l0.103,-0.047l0.104,-0.046l0.105,-0.044l0.105,-0.043l0.105,-0.041l0.105,-0.039l0.104,-0.037l0.103,-0.034l0.102,-0.03l0.1,-0.028l0.049,-0.012l0.049,-0.012l0.048,-0.01l0.048,-0.01l0.046,-0.008l0.046,-0.008l0.045,-0.006l0.045,-0.005l0.043,-0.004l0.043,-0.003l0.041,-0.002l0.041,0l0.073,0.001Zm-0.108,0.283l-0.033,0.001l-0.035,0.003l-0.036,0.003l-0.037,0.004l-0.039,0.006l-0.041,0.006l-0.041,0.008l-0.042,0.009l-0.044,0.009l-0.044,0.011l-0.044,0.011l-0.094,0.025l-0.095,0.029l-0.098,0.032l-0.099,0.035l-0.1,0.037l-0.101,0.039l-0.101,0.042l-0.101,0.043l-0.101,0.044l-0.099,0.046l-0.099,0.046l-0.097,0.047l-0.095,0.047l-0.092,0.047l-0.09,0.046l-0.086,0.046l-0.083,0.045l-0.079,0.044l-0.074,0.042l-0.069,0.039l-0.125,0.075l-0.052,0.032l-0.047,0.029l-0.014,0.01l0,0.015l0.003,0.031l0.006,0.036l0.007,0.042l0.011,0.046l0.013,0.051l0.015,0.055l0.018,0.058l0.02,0.063l0.023,0.066l0.025,0.069l0.027,0.072l0.03,0.076l0.032,0.079l0.035,0.081l0.036,0.084l0.038,0.087l0.041,0.09l0.042,0.091l0.091,0.192l0.099,0.201l0.105,0.209l0.113,0.217l0.118,0.224l0.125,0.232l0.13,0.238l0.136,0.243l0.14,0.249l0.146,0.253l0.149,0.258l0.154,0.262l0.157,0.264l0.16,0.268l0.163,0.269l0.166,0.271l0.168,0.272l0.17,0.273l0.171,0.273l0.173,0.272l0.173,0.272l0.174,0.27l0.174,0.268l0.174,0.265l0.173,0.263l0.172,0.259l0.171,0.255l0.17,0.251l0.168,0.245l0.165,0.24l0.163,0.233l0.16,0.227l0.156,0.22l0.153,0.213l0.149,0.204l0.144,0.195l0.14,0.186l0.135,0.177l0.129,0.165l0.123,0.155l0.117,0.144l0.11,0.131l0.103,0.12l0.048,0.053l0.046,0.051l0.045,0.047l0.042,0.044l0.039,0.04l0.037,0.035l0.034,0.032l0.031,0.027l0.028,0.023l0.024,0.019l0.016,0.011l0.039,-0.004l0.047,-0.007l0.05,-0.01l0.053,-0.011l0.055,-0.014l0.057,-0.016l0.059,-0.017l0.061,-0.02l0.062,-0.021l0.063,-0.023l0.064,-0.024l0.065,-0.026l0.065,-0.026l0.065,-0.028l0.065,-0.028l0.13,-0.06l0.127,-0.061l0.124,-0.061l0.119,-0.062l0.112,-0.06l0.103,-0.057l0.095,-0.053l0.082,-0.049l0.04,-0.024l0.039,-0.024l0.038,-0.025l0.038,-0.026l0.038,-0.027l0.037,-0.027l0.036,-0.028l0.036,-0.029l0.035,-0.029l0.035,-0.03l0.034,-0.031l0.034,-0.031l0.033,-0.033l0.033,-0.032l0.032,-0.034l0.032,-0.034l0.031,-0.035l0.031,-0.036l0.03,-0.036l0.03,-0.037l0.029,-0.038l0.028,-0.038l0.028,-0.039l0.028,-0.04l0.027,-0.041l0.026,-0.041l0.026,-0.042l0.025,-0.042l0.024,-0.044l0.024,-0.044l0.024,-0.044l0.022,-0.046l0.023,-0.046l0.021,-0.047l0.021,-0.048l0.021,-0.048l0.019,-0.049l0.019,-0.05l0.019,-0.05l0.018,-0.051l0.017,-0.052l0.016,-0.052l0.016,-0.054l0.015,-0.054l0.015,-0.054l0.014,-0.056l0.013,-0.055l0.012,-0.057l0.012,-0.058l0.011,-0.058l0.01,-0.059l0.01,-0.059l0.009,-0.06l0.008,-0.061l0.007,-0.062l0.007,-0.062l0.006,-0.063l0.005,-0.063l0.004,-0.065l0.004,-0.065l0.002,-0.065l0.002,-0.067l0.002,-0.066l0,-0.068l-0.001,-0.071l-0.001,-0.071l-0.002,-0.071l-0.003,-0.072l-0.004,-0.071l-0.005,-0.072l-0.005,-0.072l-0.007,-0.073l-0.007,-0.072l-0.008,-0.073l-0.009,-0.073l-0.01,-0.074l-0.01,-0.073l-0.011,-0.073l-0.013,-0.074l-0.013,-0.074l-0.013,-0.074l-0.015,-0.074l-0.015,-0.074l-0.017,-0.075l-0.016,-0.074l-0.018,-0.075l-0.019,-0.075l-0.019,-0.074l-0.041,-0.15l-0.044,-0.15l-0.046,-0.15l-0.05,-0.15l-0.053,-0.15l-0.055,-0.15l-0.059,-0.149l-0.061,-0.15l-0.064,-0.149l-0.066,-0.149l-0.069,-0.148l-0.072,-0.148l-0.074,-0.147l-0.077,-0.147l-0.08,-0.146l-0.081,-0.145l-0.084,-0.144l-0.087,-0.144l-0.089,-0.142l-0.091,-0.141l-0.093,-0.14l-0.095,-0.139l-0.098,-0.137l-0.099,-0.136l-0.102,-0.135l-0.103,-0.133l-0.106,-0.132l-0.107,-0.13l-0.109,-0.128l-0.111,-0.127l-0.113,-0.124l-0.114,-0.123l-0.116,-0.121l-0.118,-0.119l-0.119,-0.116l-0.121,-0.115l-0.122,-0.112l-0.124,-0.11l-0.124,-0.107l-0.127,-0.105l-0.127,-0.103l-0.129,-0.1l-0.13,-0.097l-0.131,-0.095l-0.066,-0.046l-0.066,-0.045l-0.066,-0.045l-0.067,-0.044l-0.067,-0.043l-0.067,-0.043l-0.068,-0.042l-0.067,-0.041l-0.068,-0.041l-0.068,-0.039l-0.068,-0.039l-0.069,-0.038l-0.069,-0.037l-0.068,-0.037l-0.069,-0.035l-0.07,-0.035l-0.079,-0.039l-0.078,-0.037l-0.078,-0.036l-0.077,-0.035l-0.077,-0.033l-0.076,-0.032l-0.076,-0.03l-0.075,-0.029l-0.075,-0.028l-0.074,-0.026l-0.074,-0.025l-0.073,-0.024l-0.073,-0.023l-0.073,-0.021l-0.072,-0.02l-0.072,-0.019l-0.071,-0.018l-0.071,-0.016l-0.071,-0.015l-0.071,-0.014l-0.07,-0.013l-0.071,-0.012l-0.07,-0.011l-0.07,-0.01l-0.069,-0.008l-0.07,-0.008l-0.069,-0.006l-0.069,-0.005l-0.07,-0.005l-0.069,-0.003l-0.069,-0.002l-0.068,-0.001l-0.033,0Z" style="fill-opacity:0.25098;"/>
  <path d="M23.579,1.207c3.096,1.54 5.609,5.303 5.609,8.398c0,3.096 -2.513,4.359 -5.609,2.82c-3.096,-1.539 -5.609,-5.302 -5.609,-8.398c0,-3.095 2.513,-4.359 5.609,-2.82Z" style="fill:#fce233;"/>
  <path d="M21.148,0.552l0.062,0.002l0.062,0.002l0.062,0.003l0.063,0.004l0.063,0.005l0.063,0.007l0.064,0.007l0.064,0.007l0.065,0.009l0.065,0.01l0.065,0.011l0.066,0.012l0.066,0.013l0.066,0.013l0.067,0.015l0.067,0.015l0.067,0.017l0.068,0.018l0.068,0.018l0.068,0.02l0.069,0.02l0.069,0.022l0.069,0.022l0.069,0.024l0.07,0.024l0.07,0.026l0.07,0.026l0.071,0.027l0.071,0.029l0.071,0.029l0.071,0.031l0.072,0.031l0.071,0.033l0.072,0.033l0.073,0.035l0.072,0.035l0.072,0.037l0.073,0.037l0.072,0.038l0.071,0.039l0.072,0.04l0.071,0.04l0.071,0.041l0.071,0.042l0.071,0.043l0.07,0.044l0.07,0.044l0.07,0.045l0.138,0.091l0.138,0.095l0.136,0.098l0.135,0.1l0.134,0.102l0.132,0.106l0.131,0.107l0.13,0.11l0.128,0.113l0.126,0.115l0.125,0.116l0.124,0.119l0.122,0.122l0.12,0.123l0.118,0.125l0.116,0.127l0.115,0.128l0.113,0.131l0.111,0.132l0.109,0.133l0.107,0.136l0.105,0.136l0.103,0.139l0.1,0.139l0.099,0.141l0.096,0.142l0.094,0.143l0.092,0.144l0.089,0.145l0.087,0.146l0.085,0.147l0.082,0.148l0.079,0.148l0.077,0.149l0.075,0.15l0.071,0.151l0.069,0.15l0.066,0.152l0.064,0.151l0.06,0.152l0.058,0.152l0.055,0.152l0.052,0.153l0.048,0.152l0.046,0.152l0.043,0.152l0.02,0.077l0.019,0.075l0.018,0.076l0.018,0.076l0.017,0.076l0.016,0.076l0.015,0.075l0.015,0.076l0.013,0.075l0.013,0.075l0.012,0.075l0.011,0.075l0.01,0.075l0.01,0.075l0.008,0.074l0.008,0.075l0.007,0.074l0.005,0.074l0.005,0.073l0.005,0.074l0.003,0.073l0.002,0.074l0.001,0.072l0.001,0.073l-0.001,0.072l-0.001,0.072l-0.002,0.071l-0.003,0.07l-0.005,0.069l-0.005,0.069l-0.005,0.068l-0.007,0.068l-0.008,0.067l-0.008,0.066l-0.01,0.065l-0.01,0.065l-0.011,0.064l-0.012,0.063l-0.013,0.062l-0.013,0.062l-0.015,0.061l-0.015,0.061l-0.016,0.059l-0.017,0.059l-0.018,0.058l-0.018,0.058l-0.019,0.057l-0.02,0.056l-0.021,0.055l-0.022,0.055l-0.023,0.053l-0.023,0.053l-0.024,0.053l-0.024,0.051l-0.026,0.051l-0.026,0.05l-0.027,0.049l-0.028,0.049l-0.028,0.048l-0.03,0.047l-0.03,0.046l-0.03,0.045l-0.031,0.045l-0.033,0.044l-0.032,0.043l-0.034,0.042l-0.034,0.042l-0.035,0.041l-0.035,0.039l-0.036,0.04l-0.037,0.038l-0.038,0.038l-0.038,0.036l-0.039,0.036l-0.039,0.035l-0.04,0.035l-0.041,0.033l-0.041,0.033l-0.042,0.032l-0.043,0.031l-0.043,0.03l-0.044,0.029l-0.044,0.029l-0.045,0.028l-0.046,0.027l-0.046,0.026l-0.046,0.025l-0.048,0.024l-0.048,0.024l-0.048,0.022l-0.049,0.022l-0.05,0.021l-0.05,0.02l-0.05,0.019l-0.051,0.019l-0.052,0.017l-0.052,0.017l-0.053,0.015l-0.053,0.015l-0.054,0.014l-0.054,0.013l-0.055,0.013l-0.055,0.011l-0.056,0.01l-0.056,0.01l-0.057,0.009l-0.057,0.007l-0.058,0.007l-0.058,0.006l-0.058,0.005l-0.059,0.004l-0.059,0.004l-0.06,0.002l-0.06,0.001l-0.061,0.001l-0.061,-0.001l-0.062,-0.001l-0.062,-0.002l-0.062,-0.004l-0.063,-0.004l-0.063,-0.005l-0.063,-0.006l-0.064,-0.007l-0.064,-0.008l-0.065,-0.009l-0.065,-0.01l-0.065,-0.011l-0.066,-0.011l-0.066,-0.013l-0.066,-0.014l-0.067,-0.014l-0.067,-0.016l-0.067,-0.017l-0.068,-0.017l-0.068,-0.019l-0.068,-0.019l-0.069,-0.021l-0.069,-0.021l-0.069,-0.023l-0.069,-0.023l-0.07,-0.025l-0.07,-0.025l-0.07,-0.027l-0.071,-0.027l-0.071,-0.028l-0.071,-0.03l-0.071,-0.03l-0.072,-0.032l-0.071,-0.032l-0.072,-0.034l-0.073,-0.034l-0.072,-0.036l-0.072,-0.036l-0.073,-0.038l-0.072,-0.038l-0.071,-0.039l-0.072,-0.039l-0.071,-0.041l-0.071,-0.041l-0.071,-0.042l-0.071,-0.043l-0.07,-0.043l-0.07,-0.044l-0.07,-0.045l-0.138,-0.092l-0.138,-0.095l-0.136,-0.097l-0.135,-0.1l-0.134,-0.103l-0.132,-0.105l-0.131,-0.108l-0.13,-0.11l-0.128,-0.112l-0.126,-0.115l-0.125,-0.117l-0.124,-0.119l-0.121,-0.121l-0.121,-0.123l-0.118,-0.125l-0.116,-0.127l-0.115,-0.129l-0.113,-0.13l-0.111,-0.132l-0.109,-0.134l-0.107,-0.135l-0.105,-0.137l-0.103,-0.138l-0.1,-0.14l-0.099,-0.14l-0.096,-0.142l-0.094,-0.143l-0.092,-0.144l-0.089,-0.146l-0.087,-0.146l-0.085,-0.147l-0.082,-0.147l-0.079,-0.149l-0.077,-0.149l-0.075,-0.15l-0.071,-0.15l-0.069,-0.151l-0.066,-0.151l-0.064,-0.152l-0.06,-0.152l-0.058,-0.152l-0.055,-0.152l-0.051,-0.152l-0.049,-0.153l-0.046,-0.152l-0.042,-0.152l-0.021,-0.076l-0.019,-0.076l-0.018,-0.076l-0.018,-0.076l-0.017,-0.076l-0.016,-0.075l-0.015,-0.076l-0.015,-0.075l-0.013,-0.076l-0.013,-0.075l-0.012,-0.075l-0.011,-0.075l-0.01,-0.075l-0.01,-0.074l-0.008,-0.075l-0.008,-0.074l-0.007,-0.074l-0.005,-0.074l-0.005,-0.074l-0.004,-0.074l-0.004,-0.073l-0.002,-0.073l-0.001,-0.073l-0.001,-0.073l0.001,-0.072l0.001,-0.071l0.002,-0.071l0.004,-0.07l0.004,-0.07l0.005,-0.069l0.005,-0.068l0.007,-0.067l0.008,-0.067l0.008,-0.066l0.01,-0.066l0.01,-0.064l0.011,-0.064l0.012,-0.063l0.013,-0.063l0.013,-0.062l0.015,-0.061l0.015,-0.06l0.016,-0.06l0.017,-0.059l0.018,-0.058l0.018,-0.058l0.019,-0.056l0.021,-0.056l0.02,-0.056l0.022,-0.054l0.023,-0.054l0.023,-0.053l0.024,-0.052l0.025,-0.052l0.025,-0.051l0.026,-0.05l0.027,-0.049l0.028,-0.048l0.028,-0.048l0.03,-0.047l0.03,-0.046l0.03,-0.046l0.032,-0.045l0.032,-0.043l0.032,-0.044l0.034,-0.042l0.034,-0.041l0.035,-0.041l0.035,-0.04l0.036,-0.039l0.037,-0.039l0.038,-0.037l0.038,-0.037l0.039,-0.036l0.039,-0.035l0.04,-0.034l0.041,-0.034l0.041,-0.032l0.042,-0.032l0.043,-0.031l0.043,-0.031l0.044,-0.029l0.044,-0.028l0.045,-0.028l0.046,-0.027l0.046,-0.026l0.046,-0.025l0.048,-0.025l0.048,-0.023l0.048,-0.023l0.049,-0.022l0.05,-0.021l0.05,-0.02l0.05,-0.019l0.051,-0.018l0.052,-0.018l0.052,-0.016l0.053,-0.016l0.053,-0.015l0.054,-0.014l0.054,-0.013l0.055,-0.012l0.055,-0.012l0.056,-0.01l0.056,-0.01l0.057,-0.008l0.057,-0.008l0.058,-0.007l0.058,-0.006l0.058,-0.005l0.059,-0.004l0.059,-0.003l0.06,-0.002l0.061,-0.002l0.06,0l0.061,0Zm-0.116,0.355l-0.055,0.001l-0.054,0.002l-0.054,0.003l-0.053,0.004l-0.053,0.005l-0.052,0.005l-0.052,0.006l-0.051,0.007l-0.051,0.008l-0.051,0.008l-0.049,0.01l-0.05,0.01l-0.048,0.011l-0.049,0.011l-0.047,0.013l-0.047,0.013l-0.047,0.014l-0.046,0.014l-0.046,0.016l-0.045,0.016l-0.044,0.017l-0.044,0.018l-0.044,0.018l-0.043,0.019l-0.042,0.02l-0.042,0.02l-0.041,0.022l-0.041,0.022l-0.04,0.022l-0.04,0.024l-0.039,0.024l-0.039,0.025l-0.038,0.025l-0.037,0.026l-0.037,0.027l-0.036,0.028l-0.036,0.028l-0.036,0.03l-0.035,0.029l-0.034,0.031l-0.034,0.031l-0.033,0.032l-0.032,0.033l-0.032,0.033l-0.032,0.034l-0.031,0.035l-0.03,0.035l-0.03,0.037l-0.029,0.037l-0.029,0.038l-0.028,0.038l-0.027,0.039l-0.027,0.04l-0.027,0.041l-0.025,0.041l-0.026,0.042l-0.024,0.043l-0.024,0.044l-0.023,0.044l-0.023,0.046l-0.022,0.046l-0.021,0.046l-0.021,0.048l-0.02,0.048l-0.02,0.049l-0.018,0.049l-0.019,0.051l-0.017,0.051l-0.017,0.052l-0.016,0.053l-0.015,0.053l-0.015,0.054l-0.014,0.055l-0.013,0.056l-0.012,0.057l-0.012,0.057l-0.011,0.058l-0.01,0.059l-0.009,0.059l-0.009,0.061l-0.008,0.061l-0.007,0.061l-0.006,0.063l-0.006,0.063l-0.004,0.064l-0.004,0.065l-0.003,0.065l-0.002,0.067l-0.001,0.067l-0.001,0.067l0.001,0.069l0.001,0.068l0.002,0.069l0.003,0.069l0.004,0.069l0.004,0.07l0.006,0.07l0.006,0.07l0.008,0.07l0.008,0.071l0.009,0.07l0.009,0.071l0.011,0.071l0.011,0.072l0.012,0.071l0.013,0.072l0.014,0.072l0.014,0.072l0.016,0.072l0.016,0.072l0.017,0.073l0.017,0.072l0.019,0.073l0.019,0.072l0.041,0.146l0.044,0.146l0.047,0.147l0.049,0.146l0.053,0.146l0.055,0.147l0.059,0.146l0.061,0.146l0.064,0.146l0.066,0.146l0.069,0.145l0.072,0.145l0.075,0.144l0.077,0.144l0.079,0.143l0.082,0.142l0.084,0.142l0.087,0.14l0.089,0.14l0.091,0.139l0.093,0.137l0.096,0.137l0.097,0.135l0.1,0.134l0.102,0.133l0.104,0.131l0.105,0.129l0.108,0.129l0.109,0.126l0.112,0.125l0.113,0.123l0.114,0.121l0.117,0.119l0.118,0.117l0.119,0.116l0.121,0.113l0.122,0.111l0.124,0.108l0.125,0.107l0.127,0.104l0.128,0.101l0.129,0.099l0.13,0.097l0.131,0.094l0.132,0.091l0.134,0.089l0.067,0.043l0.067,0.042l0.068,0.042l0.067,0.041l0.068,0.04l0.068,0.039l0.069,0.039l0.068,0.038l0.069,0.037l0.069,0.037l0.069,0.035l0.069,0.035l0.069,0.034l0.069,0.033l0.069,0.032l0.068,0.031l0.068,0.03l0.068,0.029l0.068,0.028l0.067,0.027l0.067,0.026l0.066,0.025l0.066,0.024l0.066,0.023l0.066,0.022l0.065,0.022l0.065,0.02l0.064,0.019l0.065,0.018l0.063,0.018l0.064,0.016l0.063,0.016l0.062,0.014l0.063,0.014l0.062,0.013l0.061,0.012l0.061,0.011l0.061,0.01l0.06,0.009l0.06,0.008l0.059,0.007l0.059,0.007l0.059,0.005l0.058,0.005l0.057,0.004l0.057,0.003l0.057,0.002l0.056,0.001l0.056,0.001l0.055,-0.001l0.055,-0.001l0.054,-0.002l0.054,-0.003l0.053,-0.004l0.053,-0.004l0.052,-0.005l0.052,-0.007l0.052,-0.007l0.05,-0.007l0.051,-0.009l0.049,-0.009l0.05,-0.01l0.048,-0.011l0.049,-0.012l0.047,-0.012l0.047,-0.013l0.047,-0.014l0.046,-0.015l0.046,-0.015l0.045,-0.017l0.044,-0.017l0.044,-0.017l0.044,-0.019l0.043,-0.019l0.042,-0.019l0.042,-0.021l0.041,-0.021l0.041,-0.022l0.04,-0.023l0.04,-0.023l0.039,-0.024l0.039,-0.025l0.038,-0.026l0.037,-0.026l0.037,-0.027l0.036,-0.028l0.036,-0.028l0.036,-0.029l0.035,-0.03l0.034,-0.03l0.034,-0.032l0.033,-0.032l0.032,-0.032l0.032,-0.034l0.032,-0.034l0.031,-0.035l0.03,-0.035l0.03,-0.036l0.029,-0.037l0.029,-0.038l0.028,-0.039l0.027,-0.039l0.027,-0.04l0.027,-0.04l0.026,-0.042l0.025,-0.042l0.024,-0.043l0.024,-0.044l0.023,-0.044l0.023,-0.045l0.022,-0.046l0.021,-0.047l0.021,-0.047l0.02,-0.048l0.02,-0.049l0.019,-0.05l0.018,-0.05l0.017,-0.052l0.017,-0.052l0.016,-0.052l0.015,-0.054l0.015,-0.054l0.014,-0.055l0.013,-0.056l0.012,-0.056l0.012,-0.058l0.011,-0.058l0.01,-0.058l0.01,-0.06l0.008,-0.06l0.008,-0.061l0.007,-0.062l0.006,-0.063l0.006,-0.063l0.004,-0.064l0.004,-0.064l0.003,-0.066l0.002,-0.066l0.002,-0.067l0,-0.068l0,-0.068l-0.002,-0.069l-0.002,-0.068l-0.003,-0.07l-0.004,-0.069l-0.004,-0.069l-0.006,-0.07l-0.006,-0.07l-0.008,-0.071l-0.008,-0.07l-0.008,-0.071l-0.01,-0.071l-0.011,-0.071l-0.011,-0.071l-0.012,-0.072l-0.013,-0.072l-0.014,-0.071l-0.014,-0.072l-0.016,-0.072l-0.016,-0.073l-0.017,-0.072l-0.017,-0.073l-0.019,-0.072l-0.019,-0.072l-0.041,-0.147l-0.044,-0.146l-0.046,-0.146l-0.05,-0.146l-0.053,-0.147l-0.055,-0.146l-0.059,-0.147l-0.061,-0.146l-0.064,-0.146l-0.066,-0.145l-0.069,-0.146l-0.072,-0.144l-0.075,-0.145l-0.077,-0.143l-0.079,-0.143l-0.082,-0.143l-0.084,-0.141l-0.087,-0.141l-0.089,-0.14l-0.091,-0.138l-0.093,-0.138l-0.096,-0.136l-0.097,-0.136l-0.1,-0.134l-0.102,-0.132l-0.104,-0.131l-0.105,-0.13l-0.108,-0.128l-0.109,-0.127l-0.112,-0.124l-0.113,-0.123l-0.114,-0.121l-0.117,-0.12l-0.118,-0.117l-0.119,-0.115l-0.121,-0.113l-0.122,-0.111l-0.124,-0.109l-0.125,-0.106l-0.127,-0.104l-0.128,-0.102l-0.129,-0.099l-0.13,-0.097l-0.131,-0.093l-0.132,-0.092l-0.134,-0.088l-0.067,-0.043l-0.067,-0.043l-0.068,-0.041l-0.067,-0.041l-0.068,-0.04l-0.068,-0.04l-0.069,-0.039l-0.068,-0.038l-0.069,-0.037l-0.069,-0.036l-0.069,-0.036l-0.069,-0.035l-0.069,-0.034l-0.069,-0.033l-0.069,-0.032l-0.068,-0.031l-0.068,-0.03l-0.068,-0.029l-0.067,-0.028l-0.068,-0.027l-0.066,-0.026l-0.067,-0.025l-0.066,-0.024l-0.066,-0.023l-0.066,-0.022l-0.065,-0.021l-0.065,-0.02l-0.064,-0.02l-0.064,-0.018l-0.064,-0.017l-0.064,-0.017l-0.063,-0.015l-0.062,-0.015l-0.063,-0.014l-0.061,-0.012l-0.062,-0.012l-0.061,-0.011l-0.061,-0.01l-0.06,-0.009l-0.06,-0.009l-0.059,-0.007l-0.059,-0.006l-0.058,-0.006l-0.058,-0.005l-0.058,-0.004l-0.057,-0.003l-0.057,-0.002l-0.056,-0.001l-0.056,0l-0.055,0Z" style="fill-opacity:0.101961;"/>
  <path d="M23.579,1.207c3.096,1.54 5.609,5.303 5.609,8.398c0,3.096 -2.513,4.359 -5.609,2.82c-3.096,-1.539 -5.609,-5.302 -5.609,-8.398c0,-3.095 2.513,-4.359 5.609,-2.82Z" style="fill-opacity:0.239216;"/>
</svg>'

  DONATE_BOX= '<?xml version="1.0" encoding="UTF-8" standalone="no"?><!DOCTYPE svg PUBLIC "-//W3C//DTD SVG 1.1//EN" "http://www.w3.org/Graphics/SVG/1.1/DTD/svg11.dtd">
<svg width="100%" height="100%" viewBox="0 0 48 64" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" xml:space="preserve">
  <path id="C" d="M24,32.936l0,31.064l-24.161,-12.081l0,-31.064l24.161,12.081Z"/>
  <path id="B" d="M24,32.936l0,31.064l24.161,-12.081l0,-31.064l-24.161,12.081Z"/>
  <path id="A" d="M-0.161,20.855l24.161,-12.08l24.161,12.08l-24.161,12.081l-24.161,-12.081Z"/>
  <path id="Slot" d="M16.234,18.698l3.452,-1.726l12.08,6.041l-3.452,1.725l-12.08,-6.04Z" style="fill:none;"/>
  <clipPath id="Clip1">
    <path d="M16.234,18.698l3.452,-1.726l12.08,6.041l-3.452,1.725l-12.08,-6.04Z"/>
  </clipPath>
  <g clip-path="url(#Clip1)">
    <path id="C" d="M16.234,18.698l3.452,-1.726l12.08,6.041l-3.452,1.725l-12.08,-6.04Z"/>
    <path id="B" d="M19.686,16.972l0,3.452l-3.452,-1.726l3.452,-1.726Z"/>
    <path id="Black" d="M16.234,20.424l3.452,-1.726l12.08,6.04l-3.452,1.726l-12.08,-6.04Z" style="fill-opacity:0.804348;"/>
  </g>
</svg>'

  DONATE_BTN = '<?xml version="1.0" encoding="UTF-8" standalone="no"?><!DOCTYPE svg PUBLIC "-//W3C//DTD SVG 1.1//EN" "http://www.w3.org/Graphics/SVG/1.1/DTD/svg11.dtd"><svg width="100%" height="100%" viewBox="0 0 184 40" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" xml:space="preserve"><path d="M70.167,0c0,0 88.752,0 107.74,0c2.175,0 4.072,2.124 4.6,5.151c0.742,4.617 1.16,9.621 1.16,14.849c0,5.228 -0.418,10.232 -1.179,14.842c-0.526,3.015 -2.415,5.13 -4.581,5.13c-10.938,0.016 -45.022,0.023 -71.959,0.026l0,0.002c0,0 -7.166,0 -17.735,-0.001c-10.797,0.001 -18.046,0.001 -18.046,0.001l0,-0.002c-24.483,-0.003 -54.286,-0.009 -64.482,-0.023c-2.198,0 -4.105,-2.175 -4.602,-5.247c-0.7,-4.578 -1.083,-9.542 -1.083,-14.728c0,-5.186 0.383,-10.15 1.065,-14.734c0.499,-3.083 2.414,-5.266 4.62,-5.266l64.482,0Z"/></svg>'  

  DONATE_ICON = '<span class="btn-donate" id="donateOverlay">'+DONATE_OVERLAY+'</span>
            <span class="btn-donate" id="donateCoin">'+DONATE_COIN+'</span>
            <span class="btn-donate" id="donateBox">'+DONATE_BOX+'</span>
            <span class="btn-donate" id="donateBtn">'+DONATE_BTN+'Donate</span>'
end

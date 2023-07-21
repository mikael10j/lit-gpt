# Copyright (c) 2020-2021 NVIDIA CORPORATION. All rights reserved.
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
FROM spartan10:5443/pytorch/pytorch:2.0.1-cuda11.7-cudnn8-devel

RUN apt update -y && apt install -y git
RUN pip install --no-cache-dir --index-url https://download.pytorch.org/whl/nightly/cu118 --pre 'torch>=2.1.0dev'
RUN MAX_JOBS=4 pip install --no-cache-dir 'flash-attn>=2.0.0.post1' --no-build-isolation
RUN pip install --no-cache-dir huggingface_hub
RUN pip install --no-cache-dir sentencepiece
                

WORKDIR /workspace
COPY . .

RUN pip install --no-cache-dir -r requirements.txt
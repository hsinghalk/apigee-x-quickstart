# Copyright 2022 Google LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.


export PROJECT="cloud3x" # The name of the GCP project
export NETWORK="default" # The network to use (will be created if it doesn't exist)
export LOCATION="europe-west1-a" # The location for the Apigee X instance and analytics data
export ADMIN="user@example.com" # A user who should get ownership access to the GCP project & Apigee org

gcloud config set project $PROJECT

export PROJECTNUMBER=$(gcloud projects list --filter="$(gcloud config get-value project)" --format="value(PROJECT_NUMBER)")
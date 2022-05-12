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


export PROJECT="cloud3x"
export NETWORK="default"
export LOCATION="europe-west1-a"
export APIGEE_ENV="eval"

gcloud config set project $PROJECT

export PROJECTNUMBER=$(gcloud projects list --filter="$(gcloud config get-value project)" --format="value(PROJECT_NUMBER)")

gcloud services enable orgpolicy.googleapis.com

echo "Setting organizational policy configuration..."
sed -i "s@{PROJECTNUMBER}@$PROJECTNUMBER@" policies/requireOsLogin.yaml
sed -i "s@{PROJECTNUMBER}@$PROJECTNUMBER@" policies/allowedPolicyMemberDomains.yaml
sed -i "s@{PROJECTNUMBER}@$PROJECTNUMBER@" policies/requireShieldedVm.yaml
sed -i "s@{PROJECTNUMBER}@$PROJECTNUMBER@" policies/vmExternalIpAccess.yaml

gcloud org-policies set-policy ./policies/requireOsLogin.yaml --project=$PROJECT
gcloud org-policies set-policy ./policies/allowedPolicyMemberDomains.yaml --project=$PROJECT
gcloud org-policies set-policy ./policies/requireShieldedVm.yaml --project=$PROJECT
gcloud org-policies set-policy ./policies/vmExternalIpAccess.yaml --project=$PROJECT

# Copyright 2012 Trustees of FreeBMD
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
# The idea of the field is that it defines the layout of the thing being transcribed at the most fine level. e.g. a text-field
class AtticFile
  include Mongoid::Document

  field :name, type: String
  field :date_created, type: DateTime
  field :userid, type: String
  belongs_to :userid_detail, index: true

  class << self
    def userid(user)
      where(:userid_detail_id => user)
    end
  end


end

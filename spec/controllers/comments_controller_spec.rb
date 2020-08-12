require 'rails_helper'

describe CommentsController do
  let(:room) { create(:room) }
  let(:supporter) { create(:supporter) }

  describe '#index' do

    context 'log in' do
      before do
        login supporter
        get :index, params: { room_id: room.id }
      end

      it 'assigns @comment' do
        expect(assigns(:comment)).to be_a_new(Comment)
      end

      it 'assigns @room' do
        expect(assigns(:room)).to eq room
      end

      it 'renders index' do
        expect(response).to render_template :index
      end
    end

    context 'not log in' do
      before do
        get :index, params: { room_id: room.id }
      end

      it 'redirects to new_supporter_session_path' do
        expect(response).to redirect_to(new_supporter_session_path)
      end
    end
  end

  describe '#create' do
    let(:params) { { room_id: room.id, supporter_id: supporter.id, comment: attributes_for(:comment) } }

    context 'log in' do
      before do
        login supporter
      end

      # context 'can save' do
      #   subject {
      #     post :create,
      #     params: params
      #   }

      #   it 'count up comment' do
      #     expect{ subject }.to change(Comment, :count).by(2)
      #   end

      #   it 'redirects to room_comments_path' do
      #     subject
      #     expect(response).to redirect_to(room_comments_path(room))
      #   end
      # end

      context 'can not save' do
        let(:invalid_params) { { room_id: room.id, supporter_id: supporter.id, comment: attributes_for(:comment, content: nil, image: nil) } }

        subject {
          post :create,
          params: invalid_params
        }

        it 'does not count up' do
          expect{ subject }.not_to change(Comment, :count)
        end

        it 'renders index' do
          subject
          expect(response).to render_template :index
        end
      end
    end

    context 'not log in' do

      it 'redirects to new_supporter_session_path' do
        post :create, params: params
        expect(response).to redirect_to(new_supporter_session_path)
      end
    end
  end
end
import gql from 'graphql-tag';

// insertのクエリ
export const createCard = gql`
	mutation createCard($task: TaskInputType!) {
		createCard(task: $task) {
				id
				name
				laneId
		}
	}
`;


// コピー元
  // import gql from 'graphql-tag';
  //
  // export const USER_SIGNIN = gql`
  // 	mutation SigninUser($email: String!, $password: String!) {
  // 		signInUser(email: $email, password: $password) {
  // 			token
  // 			user {
  // 				id
  // 				name
  // 			}
  // 			errors
  // 		}
  // 	}
  // 	`;

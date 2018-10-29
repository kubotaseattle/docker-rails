import gql from 'graphql-tag';

// insertのクエリ
export const CREATE_TASK = gql`
	mutation createTask($task: TaskInputType!) {
		createTask(task: $task) {
				id
				name
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

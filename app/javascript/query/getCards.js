import gql from 'graphql-tag';

// tasksテーブルのnameカラムを取得するクエリを定義
export const getCards = gql `
  {
    tasks{
      id
      name
      laneId
    }
  }
`;

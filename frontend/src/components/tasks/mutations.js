import { gql } from '@apollo/client';

export const CREATE_TASK = gql`
  mutation CreateTask($title: String!, $description: String) {
    createTask(input: { taskInput: { title: $title, description: $description } }) {
      task {
        id
        title
        description
      }
    }
  }
`;

export const UPDATE_TASK_COMPLETION = gql`
  mutation UpdateTaskCompletion($id: ID!, $completed: Boolean!) {
    updateTaskCompletion(input: { taskInput: { id: $id, completed: $completed } }) {
      task {
        id
        completed
      }
    }
  }
`;

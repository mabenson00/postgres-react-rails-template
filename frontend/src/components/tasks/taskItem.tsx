import React from 'react';
import { useMutation } from '@apollo/client';
import { UPDATE_TASK_COMPLETION } from './mutations';

interface TaskItemProps {
  id: string;
  title: string;
  description: string;
  dueDate: string;
  completed: boolean;
  refetch: () => void;
}

const TaskItem: React.FC<TaskItemProps> = ({ id, title, description, dueDate, completed, refetch }) => {
  const [updateTaskCompletion] = useMutation(UPDATE_TASK_COMPLETION);

  const handleCheckboxChange = () => {
    updateTaskCompletion({ variables: { input: { id, completed: !completed } } }).then(() => {
      refetch();
    });
  };

  return (
    <li className={`task-item ${completed ? 'completed' : ''}`}>
      <div>
        <h2>{title}</h2>
        <p>{description}</p>
        <p>Due: {dueDate}</p>
      </div>
      <div>
        <label>
          Completed:
          <input
            type="checkbox"
            checked={completed}
            onChange={handleCheckboxChange}
          />
        </label>
      </div>
    </li>
  );
};

export default TaskItem;

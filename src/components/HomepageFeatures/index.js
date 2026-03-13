import clsx from 'clsx';
import Heading from '@theme/Heading';
import styles from './styles.module.css';

const FeatureList = [
  {
    title: 'Curated Learning Paths',
    description: (
      <>
        Explore a structured roadmap from core mathematics to modern deep
        learning with practical, beginner-friendly notes.
      </>
    ),
  },
  {
    title: 'Clear Explanations',
    description: (
      <>
        Concepts are written in plain language first, then connected to
        equations and code so ideas stay intuitive and practical.
      </>
    ),
  },
  {
    title: 'Built for Practice',
    description: (
      <>
        Each section is designed to be extended with projects, experiments, and
        references as your ML journey grows.
      </>
    ),
  },
];

function Feature({title, description}) {
  return (
    <div className={clsx('col col--4')}>
      <div className="text--center padding-horiz--md">
        <Heading as="h3">{title}</Heading>
        <p>{description}</p>
      </div>
    </div>
  );
}

export default function HomepageFeatures() {
  return (
    <section className={styles.features}>
      <div className="container">
        <div className="row">
          {FeatureList.map((props, idx) => (
            <Feature key={idx} {...props} />
          ))}
        </div>
      </div>
    </section>
  );
}

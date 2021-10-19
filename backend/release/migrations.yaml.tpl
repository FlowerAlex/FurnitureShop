apiVersion: batch/v1
kind: Job
metadata:
  name: furnitureshop-migrations
  namespace: ${NAMESPACE}
  labels:
    project: furnitureshop
    component: migrations
spec:
  backoffLimit: 2
  template:
    metadata:
      labels:
        project: furnitureshop
        component: migrations
    spec:
      restartPolicy: OnFailure
      containers:
        - name: migrations
          image: leancode.azurecr.io/furnitureshop-migrations:${APP_VERSION}
          resources:
            requests:
              cpu: 50m
              memory: 200Mi
          env:
            - name: ConnectionStrings__Database
              valueFrom:
                secretKeyRef:
                  name: furnitureshop-migrations
                  key: ConnectionStrings__Database

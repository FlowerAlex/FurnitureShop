apiVersion: apps/v1
kind: Deployment
metadata:
  name: furnitureshop-api
  namespace: ${NAMESPACE}
  labels:
    app: furnitureshop
    component: api
    environment: ${ENVIRONMENT}
spec:
  selector:
    matchLabels:
      app: furnitureshop
      component: api
      environment: ${ENVIRONMENT}
  replicas: 1
  revisionHistoryLimit: 3
  template:
    metadata:
      labels:
        app: furnitureshop
        component: api
        environment: ${ENVIRONMENT}
    spec:
      containers:
        - name: api
          image: leancode.azurecr.io/furnitureshop-api:${APP_VERSION}
          resources:
            requests:
              cpu: 50m
              memory: 200Mi
            limits:
              cpu: 500m
              memory: 300Mi
          envFrom:
            - secretRef:
                name: furnitureshop-api
          ports:
            - containerPort: 80
          livenessProbe:
            httpGet:
              path: /live/health
              port: 80
            initialDelaySeconds: 15
            periodSeconds: 5
            timeoutSeconds: 5
          readinessProbe:
            httpGet:
              path: /live/ready
              port: 80
            initialDelaySeconds: 20
            periodSeconds: 10
            timeoutSeconds: 5
---
apiVersion: v1
kind: Service
metadata:
  name: furnitureshop-api
  namespace: ${NAMESPACE}
  labels:
    app: furnitureshop
    component: api
    environment: ${ENVIRONMENT}
spec:
  type: ClusterIP
  ports:
    - port: 80
  selector:
    app: furnitureshop
    component: api
    environment: ${ENVIRONMENT}

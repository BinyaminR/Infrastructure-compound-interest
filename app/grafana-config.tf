resource "kubernetes_manifest" "configmap_prometheus_dashboards_k8s_addons_prometheus" {
  manifest = {
    "apiVersion" = "v1"
    "data" = {
      "k8s-addons-prometheus.json" = <<-EOT
      {
        "__inputs": [
          {
            "name": "DS_PROMETHEUS",
            "label": "Prometheus",
            "description": "",
            "type": "datasource",
            "pluginId": "prometheus",
            "pluginName": "Prometheus"
          }
        ],
        "__elements": [],
        "__requires": [
          {
            "type": "grafana",
            "id": "grafana",
            "name": "Grafana",
            "version": "8.5.0"
          },
          {
            "type": "datasource",
            "id": "prometheus",
            "name": "Prometheus",
            "version": "5.0.0"
          },
          {
            "type": "panel",
            "id": "timeseries",
            "name": "Time series",
            "version": ""
          },
          {
            "type": "panel",
            "id": "stat",
            "name": "Stat",
            "version": ""
          },
          {
            "type": "panel",
            "id": "table",
            "name": "Table",
            "version": ""
          }
        ],
        "annotations": {
          "list": [
            {
              "builtIn": 1,
              "datasource": {
                "type": "datasource",
                "uid": "grafana"
              },
              "enable": true,
              "hide": true,
              "iconColor": "rgba(0, 211, 255, 1)",
              "name": "Annotations & Alerts",
              "target": {
                "limit": 100,
                "matchAny": false,
                "tags": [],
                "type": "dashboard"
              },
              "type": "dashboard"
            }
          ]
        },
        "description": "This is a modern 'Prometheus' dashboard for your Kubernetes cluster(s). Made for kube-prometheus-stack and take advantage of the latest Grafana features. GitHub repository: https://github.com/dotdc/grafana-dashboards-kubernetes",
        "editable": true,
        "fiscalYearStartMonth": 0,
        "graphTooltip": 1,
        "links": [],
        "liveNow": false,
        "panels": [
          {
            "collapsed": false,
            "datasource": {
              "type": "prometheus",
              "uid": "prometheus"
            },
            "gridPos": {
              "h": 1,
              "w": 24,
              "x": 0,
              "y": 0
            },
            "id": 89,
            "panels": [],
            "targets": [
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "prometheus"
                },
                "refId": "A"
              }
            ],
            "title": "Information",
            "type": "row"
          },
          {
            "datasource": {
              "type": "prometheus",
              "uid": "$${datasource}"
            },
            "fieldConfig": {
              "defaults": {
                "mappings": [],
                "noValue": "?",
                "thresholds": {
                  "mode": "absolute",
                  "steps": [
                    {
                      "color": "orange",
                      "value": null
                    }
                  ]
                }
              },
              "overrides": []
            },
            "gridPos": {
              "h": 4,
              "w": 6,
              "x": 0,
              "y": 1
            },
            "id": 78,
            "options": {
              "colorMode": "value",
              "graphMode": "none",
              "justifyMode": "auto",
              "orientation": "auto",
              "reduceOptions": {
                "calcs": [
                  "last"
                ],
                "fields": "",
                "values": false
              },
              "text": {},
              "textMode": "name"
            },
            "pluginVersion": "10.0.1",
            "targets": [
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "$${datasource}"
                },
                "editorMode": "code",
                "exemplar": false,
                "expr": "prometheus_build_info{pod=~\"$pod\"}",
                "instant": true,
                "interval": "",
                "legendFormat": "{{ version }}",
                "range": false,
                "refId": "A"
              }
            ],
            "title": "Prometheus version",
            "type": "stat"
          },
          {
            "datasource": {
              "type": "prometheus",
              "uid": "$${datasource}"
            },
            "fieldConfig": {
              "defaults": {
                "mappings": [],
                "noValue": "0",
                "thresholds": {
                  "mode": "absolute",
                  "steps": [
                    {
                      "color": "green",
                      "value": null
                    },
                    {
                      "color": "red",
                      "value": 1
                    }
                  ]
                }
              },
              "overrides": []
            },
            "gridPos": {
              "h": 4,
              "w": 6,
              "x": 6,
              "y": 1
            },
            "id": 92,
            "options": {
              "colorMode": "value",
              "graphMode": "none",
              "justifyMode": "auto",
              "orientation": "auto",
              "reduceOptions": {
                "calcs": [
                  "last"
                ],
                "fields": "",
                "values": false
              },
              "text": {},
              "textMode": "value"
            },
            "pluginVersion": "10.0.1",
            "targets": [
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "$${datasource}"
                },
                "editorMode": "code",
                "exemplar": false,
                "expr": "up{pod=~\"$pod\"} < 1",
                "instant": true,
                "interval": "",
                "legendFormat": "__auto",
                "range": false,
                "refId": "A"
              }
            ],
            "title": "Instance Down",
            "type": "stat"
          },
          {
            "datasource": {
              "type": "prometheus",
              "uid": "$${datasource}"
            },
            "fieldConfig": {
              "defaults": {
                "mappings": [],
                "noValue": "0",
                "thresholds": {
                  "mode": "absolute",
                  "steps": [
                    {
                      "color": "text",
                      "value": null
                    }
                  ]
                }
              },
              "overrides": []
            },
            "gridPos": {
              "h": 4,
              "w": 6,
              "x": 12,
              "y": 1
            },
            "id": 72,
            "options": {
              "colorMode": "value",
              "graphMode": "area",
              "justifyMode": "auto",
              "orientation": "auto",
              "reduceOptions": {
                "calcs": [],
                "fields": "",
                "values": false
              },
              "text": {},
              "textMode": "value"
            },
            "pluginVersion": "10.0.1",
            "targets": [
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "$${datasource}"
                },
                "editorMode": "code",
                "expr": "sum(prometheus_tsdb_head_series{pod=~\"$pod\"}) by (pod)",
                "interval": "",
                "legendFormat": "__auto",
                "range": true,
                "refId": "A"
              }
            ],
            "title": "TSDB Head Series",
            "type": "stat"
          },
          {
            "datasource": {
              "type": "prometheus",
              "uid": "$${datasource}"
            },
            "fieldConfig": {
              "defaults": {
                "mappings": [],
                "noValue": "0",
                "thresholds": {
                  "mode": "absolute",
                  "steps": [
                    {
                      "color": "blue",
                      "value": null
                    }
                  ]
                }
              },
              "overrides": []
            },
            "gridPos": {
              "h": 4,
              "w": 6,
              "x": 18,
              "y": 1
            },
            "id": 94,
            "options": {
              "colorMode": "value",
              "graphMode": "none",
              "justifyMode": "auto",
              "orientation": "auto",
              "reduceOptions": {
                "calcs": [
                  "last"
                ],
                "fields": "",
                "values": false
              },
              "text": {},
              "textMode": "value"
            },
            "pluginVersion": "10.0.1",
            "targets": [
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "$${datasource}"
                },
                "editorMode": "code",
                "exemplar": false,
                "expr": "sum(prometheus_sd_discovered_targets{pod=~\"$pod\"}) by (pod)",
                "instant": true,
                "interval": "",
                "legendFormat": "__auto",
                "range": false,
                "refId": "A"
              }
            ],
            "title": "Discovered Targets",
            "type": "stat"
          },
          {
            "collapsed": false,
            "datasource": {
              "type": "prometheus",
              "uid": "prometheus"
            },
            "gridPos": {
              "h": 1,
              "w": 24,
              "x": 0,
              "y": 5
            },
            "id": 64,
            "panels": [],
            "targets": [
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "prometheus"
                },
                "refId": "A"
              }
            ],
            "title": "Prometheus",
            "type": "row"
          },
          {
            "datasource": {
              "type": "prometheus",
              "uid": "$${datasource}"
            },
            "fieldConfig": {
              "defaults": {
                "color": {
                  "mode": "palette-classic"
                },
                "custom": {
                  "axisCenteredZero": false,
                  "axisColorMode": "text",
                  "axisLabel": "",
                  "axisPlacement": "auto",
                  "barAlignment": 0,
                  "drawStyle": "line",
                  "fillOpacity": 25,
                  "gradientMode": "opacity",
                  "hideFrom": {
                    "legend": false,
                    "tooltip": false,
                    "viz": false
                  },
                  "lineInterpolation": "smooth",
                  "lineStyle": {
                    "fill": "solid"
                  },
                  "lineWidth": 2,
                  "pointSize": 5,
                  "scaleDistribution": {
                    "type": "linear"
                  },
                  "showPoints": "never",
                  "spanNulls": false,
                  "stacking": {
                    "group": "A",
                    "mode": "none"
                  },
                  "thresholdsStyle": {
                    "mode": "off"
                  }
                },
                "mappings": [],
                "thresholds": {
                  "mode": "absolute",
                  "steps": [
                    {
                      "color": "green",
                      "value": null
                    }
                  ]
                },
                "unit": "short"
              },
              "overrides": []
            },
            "gridPos": {
              "h": 8,
              "w": 12,
              "x": 0,
              "y": 6
            },
            "id": 93,
            "options": {
              "legend": {
                "calcs": [
                  "min",
                  "max",
                  "mean"
                ],
                "displayMode": "list",
                "placement": "right",
                "showLegend": false
              },
              "tooltip": {
                "mode": "multi",
                "sort": "desc"
              }
            },
            "pluginVersion": "8.3.3",
            "targets": [
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "$${datasource}"
                },
                "editorMode": "code",
                "exemplar": true,
                "expr": "up{pod=~\"$pod\"}",
                "interval": "",
                "legendFormat": "{{ pod }}",
                "range": true,
                "refId": "A"
              }
            ],
            "title": "Liveness by pod",
            "type": "timeseries"
          },
          {
            "datasource": {
              "type": "prometheus",
              "uid": "$${datasource}"
            },
            "fieldConfig": {
              "defaults": {
                "color": {
                  "mode": "palette-classic"
                },
                "custom": {
                  "axisCenteredZero": false,
                  "axisColorMode": "text",
                  "axisLabel": "",
                  "axisPlacement": "auto",
                  "barAlignment": 0,
                  "drawStyle": "line",
                  "fillOpacity": 25,
                  "gradientMode": "opacity",
                  "hideFrom": {
                    "legend": false,
                    "tooltip": false,
                    "viz": false
                  },
                  "lineInterpolation": "smooth",
                  "lineStyle": {
                    "fill": "solid"
                  },
                  "lineWidth": 2,
                  "pointSize": 5,
                  "scaleDistribution": {
                    "type": "linear"
                  },
                  "showPoints": "never",
                  "spanNulls": false,
                  "stacking": {
                    "group": "A",
                    "mode": "none"
                  },
                  "thresholdsStyle": {
                    "mode": "off"
                  }
                },
                "mappings": [],
                "thresholds": {
                  "mode": "absolute",
                  "steps": [
                    {
                      "color": "green",
                      "value": null
                    }
                  ]
                },
                "unit": "short"
              },
              "overrides": []
            },
            "gridPos": {
              "h": 8,
              "w": 12,
              "x": 12,
              "y": 6
            },
            "id": 96,
            "options": {
              "legend": {
                "calcs": [
                  "min",
                  "max",
                  "mean"
                ],
                "displayMode": "list",
                "placement": "right",
                "showLegend": false
              },
              "tooltip": {
                "mode": "multi",
                "sort": "desc"
              }
            },
            "pluginVersion": "8.3.3",
            "targets": [
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "$${datasource}"
                },
                "editorMode": "code",
                "exemplar": true,
                "expr": "sum(prometheus_config_last_reload_successful{pod=~\"$pod\"}) by (pod)",
                "interval": "",
                "legendFormat": "{{ pod }}",
                "range": true,
                "refId": "A"
              }
            ],
            "title": "Config - Last Successful Reload by pod",
            "type": "timeseries"
          },
          {
            "datasource": {
              "type": "prometheus",
              "uid": "$${datasource}"
            },
            "fieldConfig": {
              "defaults": {
                "color": {
                  "mode": "palette-classic"
                },
                "custom": {
                  "axisCenteredZero": false,
                  "axisColorMode": "text",
                  "axisLabel": "",
                  "axisPlacement": "auto",
                  "barAlignment": 0,
                  "drawStyle": "line",
                  "fillOpacity": 25,
                  "gradientMode": "opacity",
                  "hideFrom": {
                    "legend": false,
                    "tooltip": false,
                    "viz": false
                  },
                  "lineInterpolation": "smooth",
                  "lineStyle": {
                    "fill": "solid"
                  },
                  "lineWidth": 2,
                  "pointSize": 5,
                  "scaleDistribution": {
                    "type": "linear"
                  },
                  "showPoints": "never",
                  "spanNulls": false,
                  "stacking": {
                    "group": "A",
                    "mode": "none"
                  },
                  "thresholdsStyle": {
                    "mode": "off"
                  }
                },
                "mappings": [],
                "thresholds": {
                  "mode": "absolute",
                  "steps": [
                    {
                      "color": "green",
                      "value": null
                    },
                    {
                      "color": "red",
                      "value": 80
                    }
                  ]
                },
                "unit": "short"
              },
              "overrides": []
            },
            "gridPos": {
              "h": 8,
              "w": 12,
              "x": 0,
              "y": 14
            },
            "id": 74,
            "options": {
              "legend": {
                "calcs": [
                  "min",
                  "max",
                  "mean"
                ],
                "displayMode": "list",
                "placement": "right",
                "showLegend": false
              },
              "tooltip": {
                "mode": "multi",
                "sort": "desc"
              }
            },
            "pluginVersion": "8.3.3",
            "targets": [
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "$${datasource}"
                },
                "editorMode": "code",
                "exemplar": true,
                "expr": "sum(rate(prometheus_target_scrapes_exceeded_body_size_limit_total{pod=~\"$pod\"}[$__rate_interval])) by (pod)",
                "interval": "",
                "legendFormat": "{{ pod }} - Exceeded body size limit",
                "range": true,
                "refId": "A"
              },
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "$${datasource}"
                },
                "editorMode": "code",
                "expr": "sum(rate(prometheus_target_scrapes_exceeded_sample_limit_total{pod=~\"$pod\"}[$__rate_interval])) by (pod)",
                "hide": false,
                "legendFormat": "{{ pod }} - Exceeded sample limit",
                "range": true,
                "refId": "B"
              },
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "$${datasource}"
                },
                "editorMode": "code",
                "expr": "sum(rate(prometheus_target_scrapes_sample_duplicate_timestamp_total{pod=~\"$pod\"}[$__rate_interval])) by (pod)",
                "hide": false,
                "legendFormat": "{{ pod }} - Duplicate timestamp",
                "range": true,
                "refId": "C"
              },
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "$${datasource}"
                },
                "editorMode": "code",
                "expr": "sum(rate(prometheus_target_scrapes_sample_out_of_bounds_total{pod=~\"$pod\"}[$__rate_interval])) by (pod)",
                "hide": false,
                "legendFormat": "{{ pod }} - Sample out of bounds",
                "range": true,
                "refId": "D"
              },
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "$${datasource}"
                },
                "editorMode": "code",
                "expr": "sum(rate(prometheus_target_scrapes_sample_out_of_order_total{pod=~\"$pod\"}[$__rate_interval])) by (pod)",
                "hide": false,
                "legendFormat": "{{ pod }} - Sample out of order",
                "range": true,
                "refId": "E"
              }
            ],
            "title": "Target Scrapes Errors by pod",
            "type": "timeseries"
          },
          {
            "datasource": {
              "type": "prometheus",
              "uid": "$${datasource}"
            },
            "fieldConfig": {
              "defaults": {
                "color": {
                  "mode": "palette-classic"
                },
                "custom": {
                  "axisCenteredZero": false,
                  "axisColorMode": "text",
                  "axisLabel": "",
                  "axisPlacement": "auto",
                  "barAlignment": 0,
                  "drawStyle": "line",
                  "fillOpacity": 25,
                  "gradientMode": "opacity",
                  "hideFrom": {
                    "legend": false,
                    "tooltip": false,
                    "viz": false
                  },
                  "lineInterpolation": "smooth",
                  "lineStyle": {
                    "fill": "solid"
                  },
                  "lineWidth": 2,
                  "pointSize": 5,
                  "scaleDistribution": {
                    "type": "linear"
                  },
                  "showPoints": "never",
                  "spanNulls": false,
                  "stacking": {
                    "group": "A",
                    "mode": "none"
                  },
                  "thresholdsStyle": {
                    "mode": "off"
                  }
                },
                "mappings": [],
                "thresholds": {
                  "mode": "absolute",
                  "steps": [
                    {
                      "color": "green",
                      "value": null
                    },
                    {
                      "color": "red",
                      "value": 80
                    }
                  ]
                },
                "unit": "short"
              },
              "overrides": []
            },
            "gridPos": {
              "h": 8,
              "w": 12,
              "x": 12,
              "y": 14
            },
            "id": 84,
            "options": {
              "legend": {
                "calcs": [
                  "min",
                  "max",
                  "mean"
                ],
                "displayMode": "list",
                "placement": "right",
                "showLegend": false
              },
              "tooltip": {
                "mode": "multi",
                "sort": "desc"
              }
            },
            "pluginVersion": "8.3.3",
            "targets": [
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "$${datasource}"
                },
                "editorMode": "code",
                "exemplar": true,
                "expr": "sum(prometheus_sd_discovered_targets{pod=~\"$pod\"}) by (pod)",
                "interval": "",
                "legendFormat": "{{ pod }}",
                "range": true,
                "refId": "A"
              }
            ],
            "title": "Number of Targets by pod",
            "type": "timeseries"
          },
          {
            "datasource": {
              "type": "prometheus",
              "uid": "$${datasource}"
            },
            "fieldConfig": {
              "defaults": {
                "color": {
                  "mode": "palette-classic"
                },
                "custom": {
                  "axisCenteredZero": false,
                  "axisColorMode": "text",
                  "axisLabel": "",
                  "axisPlacement": "auto",
                  "barAlignment": 0,
                  "drawStyle": "line",
                  "fillOpacity": 25,
                  "gradientMode": "opacity",
                  "hideFrom": {
                    "legend": false,
                    "tooltip": false,
                    "viz": false
                  },
                  "lineInterpolation": "smooth",
                  "lineStyle": {
                    "fill": "solid"
                  },
                  "lineWidth": 2,
                  "pointSize": 5,
                  "scaleDistribution": {
                    "type": "linear"
                  },
                  "showPoints": "never",
                  "spanNulls": false,
                  "stacking": {
                    "group": "A",
                    "mode": "none"
                  },
                  "thresholdsStyle": {
                    "mode": "off"
                  }
                },
                "mappings": [],
                "thresholds": {
                  "mode": "absolute",
                  "steps": [
                    {
                      "color": "green",
                      "value": null
                    },
                    {
                      "color": "red",
                      "value": 80
                    }
                  ]
                },
                "unit": "ms"
              },
              "overrides": []
            },
            "gridPos": {
              "h": 8,
              "w": 12,
              "x": 0,
              "y": 22
            },
            "id": 75,
            "options": {
              "legend": {
                "calcs": [
                  "min",
                  "max",
                  "mean"
                ],
                "displayMode": "list",
                "placement": "right",
                "showLegend": false
              },
              "tooltip": {
                "mode": "multi",
                "sort": "desc"
              }
            },
            "pluginVersion": "8.3.3",
            "targets": [
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "$${datasource}"
                },
                "editorMode": "code",
                "exemplar": true,
                "expr": "sum(rate(prometheus_target_sync_length_seconds_sum{pod=~\"$pod\"}[$__rate_interval])) by (pod, scrape_job) * 1000",
                "interval": "",
                "legendFormat": "{{ pod }} - {{ scrape_job }}",
                "range": true,
                "refId": "A"
              }
            ],
            "title": "Target Sync by pod, scrape_job",
            "type": "timeseries"
          },
          {
            "datasource": {
              "type": "prometheus",
              "uid": "$${datasource}"
            },
            "fieldConfig": {
              "defaults": {
                "color": {
                  "mode": "palette-classic"
                },
                "custom": {
                  "axisCenteredZero": false,
                  "axisColorMode": "text",
                  "axisLabel": "",
                  "axisPlacement": "auto",
                  "barAlignment": 0,
                  "drawStyle": "line",
                  "fillOpacity": 25,
                  "gradientMode": "opacity",
                  "hideFrom": {
                    "legend": false,
                    "tooltip": false,
                    "viz": false
                  },
                  "lineInterpolation": "smooth",
                  "lineStyle": {
                    "fill": "solid"
                  },
                  "lineWidth": 2,
                  "pointSize": 5,
                  "scaleDistribution": {
                    "type": "linear"
                  },
                  "showPoints": "never",
                  "spanNulls": false,
                  "stacking": {
                    "group": "A",
                    "mode": "none"
                  },
                  "thresholdsStyle": {
                    "mode": "off"
                  }
                },
                "mappings": [],
                "thresholds": {
                  "mode": "absolute",
                  "steps": [
                    {
                      "color": "green",
                      "value": null
                    },
                    {
                      "color": "red",
                      "value": 80
                    }
                  ]
                },
                "unit": "s"
              },
              "overrides": []
            },
            "gridPos": {
              "h": 8,
              "w": 12,
              "x": 12,
              "y": 22
            },
            "id": 85,
            "options": {
              "legend": {
                "calcs": [
                  "min",
                  "max",
                  "mean"
                ],
                "displayMode": "list",
                "placement": "right",
                "showLegend": false
              },
              "tooltip": {
                "mode": "multi",
                "sort": "desc"
              }
            },
            "pluginVersion": "8.3.3",
            "targets": [
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "$${datasource}"
                },
                "editorMode": "code",
                "exemplar": true,
                "expr": "round(sum(rate(prometheus_target_interval_length_seconds_sum{pod=~\"$pod\"}[$__rate_interval]) / rate(prometheus_target_interval_length_seconds_count{pod=~\"$pod\"}[$__rate_interval])) by (pod))",
                "interval": "",
                "legendFormat": "{{ pod }}",
                "range": true,
                "refId": "A"
              }
            ],
            "title": "Average Scrape Interval by pod",
            "type": "timeseries"
          },
          {
            "collapsed": false,
            "datasource": {
              "type": "prometheus",
              "uid": "prometheus"
            },
            "gridPos": {
              "h": 1,
              "w": 24,
              "x": 0,
              "y": 30
            },
            "id": 98,
            "panels": [],
            "targets": [
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "prometheus"
                },
                "refId": "A"
              }
            ],
            "title": "Prometheus TSDB / Query Engine",
            "type": "row"
          },
          {
            "datasource": {
              "type": "prometheus",
              "uid": "$${datasource}"
            },
            "fieldConfig": {
              "defaults": {
                "color": {
                  "mode": "palette-classic"
                },
                "custom": {
                  "axisCenteredZero": false,
                  "axisColorMode": "text",
                  "axisLabel": "",
                  "axisPlacement": "auto",
                  "barAlignment": 0,
                  "drawStyle": "line",
                  "fillOpacity": 25,
                  "gradientMode": "opacity",
                  "hideFrom": {
                    "legend": false,
                    "tooltip": false,
                    "viz": false
                  },
                  "lineInterpolation": "smooth",
                  "lineStyle": {
                    "fill": "solid"
                  },
                  "lineWidth": 2,
                  "pointSize": 5,
                  "scaleDistribution": {
                    "type": "linear"
                  },
                  "showPoints": "never",
                  "spanNulls": false,
                  "stacking": {
                    "group": "A",
                    "mode": "none"
                  },
                  "thresholdsStyle": {
                    "mode": "off"
                  }
                },
                "mappings": [],
                "thresholds": {
                  "mode": "absolute",
                  "steps": [
                    {
                      "color": "green",
                      "value": null
                    },
                    {
                      "color": "red",
                      "value": 80
                    }
                  ]
                },
                "unit": "short"
              },
              "overrides": []
            },
            "gridPos": {
              "h": 8,
              "w": 12,
              "x": 0,
              "y": 31
            },
            "id": 59,
            "options": {
              "legend": {
                "calcs": [
                  "min",
                  "max",
                  "mean"
                ],
                "displayMode": "list",
                "placement": "right",
                "showLegend": false
              },
              "tooltip": {
                "mode": "multi",
                "sort": "desc"
              }
            },
            "pluginVersion": "8.3.3",
            "targets": [
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "$${datasource}"
                },
                "editorMode": "code",
                "exemplar": true,
                "expr": "sum(prometheus_tsdb_head_series{pod=~\"$pod\"}) by (pod)",
                "interval": "",
                "legendFormat": "{{ pod }} - Head Series",
                "range": true,
                "refId": "A"
              },
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "$${datasource}"
                },
                "editorMode": "code",
                "expr": "sum(prometheus_tsdb_head_chunks{pod=~\"$pod\"}) by (pod)",
                "hide": false,
                "legendFormat": "{{ pod }} - Head Chunks",
                "range": true,
                "refId": "B"
              }
            ],
            "title": "TSDB Head Series & Chunks by pod",
            "type": "timeseries"
          },
          {
            "datasource": {
              "type": "prometheus",
              "uid": "$${datasource}"
            },
            "fieldConfig": {
              "defaults": {
                "color": {
                  "mode": "palette-classic"
                },
                "custom": {
                  "axisCenteredZero": false,
                  "axisColorMode": "text",
                  "axisLabel": "",
                  "axisPlacement": "auto",
                  "barAlignment": 0,
                  "drawStyle": "line",
                  "fillOpacity": 25,
                  "gradientMode": "opacity",
                  "hideFrom": {
                    "legend": false,
                    "tooltip": false,
                    "viz": false
                  },
                  "lineInterpolation": "smooth",
                  "lineStyle": {
                    "fill": "solid"
                  },
                  "lineWidth": 2,
                  "pointSize": 5,
                  "scaleDistribution": {
                    "type": "linear"
                  },
                  "showPoints": "never",
                  "spanNulls": false,
                  "stacking": {
                    "group": "A",
                    "mode": "none"
                  },
                  "thresholdsStyle": {
                    "mode": "off"
                  }
                },
                "mappings": [],
                "thresholds": {
                  "mode": "absolute",
                  "steps": [
                    {
                      "color": "green",
                      "value": null
                    },
                    {
                      "color": "red",
                      "value": 80
                    }
                  ]
                },
                "unit": "short"
              },
              "overrides": []
            },
            "gridPos": {
              "h": 8,
              "w": 12,
              "x": 12,
              "y": 31
            },
            "id": 60,
            "options": {
              "legend": {
                "calcs": [
                  "min",
                  "max",
                  "mean"
                ],
                "displayMode": "list",
                "placement": "right",
                "showLegend": false
              },
              "tooltip": {
                "mode": "multi",
                "sort": "desc"
              }
            },
            "pluginVersion": "8.3.3",
            "targets": [
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "$${datasource}"
                },
                "editorMode": "code",
                "exemplar": true,
                "expr": "sum(rate(prometheus_tsdb_head_samples_appended_total{pod=~\"$pod\"}[$__rate_interval])) by (pod)",
                "interval": "",
                "legendFormat": "{{ pod }}",
                "range": true,
                "refId": "A"
              }
            ],
            "title": "TSDB Head samples appended - rate by pod",
            "type": "timeseries"
          },
          {
            "datasource": {
              "type": "prometheus",
              "uid": "$${datasource}"
            },
            "fieldConfig": {
              "defaults": {
                "color": {
                  "mode": "palette-classic"
                },
                "custom": {
                  "axisCenteredZero": false,
                  "axisColorMode": "text",
                  "axisLabel": "",
                  "axisPlacement": "auto",
                  "barAlignment": 0,
                  "drawStyle": "line",
                  "fillOpacity": 25,
                  "gradientMode": "opacity",
                  "hideFrom": {
                    "legend": false,
                    "tooltip": false,
                    "viz": false
                  },
                  "lineInterpolation": "smooth",
                  "lineStyle": {
                    "fill": "solid"
                  },
                  "lineWidth": 2,
                  "pointSize": 5,
                  "scaleDistribution": {
                    "type": "linear"
                  },
                  "showPoints": "never",
                  "spanNulls": false,
                  "stacking": {
                    "group": "A",
                    "mode": "none"
                  },
                  "thresholdsStyle": {
                    "mode": "off"
                  }
                },
                "mappings": [],
                "thresholds": {
                  "mode": "absolute",
                  "steps": [
                    {
                      "color": "green",
                      "value": null
                    },
                    {
                      "color": "red",
                      "value": 80
                    }
                  ]
                },
                "unit": "short"
              },
              "overrides": []
            },
            "gridPos": {
              "h": 8,
              "w": 12,
              "x": 0,
              "y": 39
            },
            "id": 101,
            "options": {
              "legend": {
                "calcs": [
                  "min",
                  "max",
                  "mean"
                ],
                "displayMode": "list",
                "placement": "right",
                "showLegend": false
              },
              "tooltip": {
                "mode": "multi",
                "sort": "desc"
              }
            },
            "pluginVersion": "8.3.3",
            "targets": [
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "$${datasource}"
                },
                "editorMode": "code",
                "exemplar": true,
                "expr": "sum(prometheus_tsdb_blocks_loaded{pod=~\"$pod\"}) by (pod)",
                "interval": "",
                "legendFormat": "{{ pod }} - Head Series",
                "range": true,
                "refId": "A"
              }
            ],
            "title": "TSDB Blocks Loaded by pod",
            "type": "timeseries"
          },
          {
            "datasource": {
              "type": "prometheus",
              "uid": "$${datasource}"
            },
            "fieldConfig": {
              "defaults": {
                "color": {
                  "mode": "palette-classic"
                },
                "custom": {
                  "axisCenteredZero": false,
                  "axisColorMode": "text",
                  "axisLabel": "",
                  "axisPlacement": "auto",
                  "barAlignment": 0,
                  "drawStyle": "line",
                  "fillOpacity": 25,
                  "gradientMode": "opacity",
                  "hideFrom": {
                    "legend": false,
                    "tooltip": false,
                    "viz": false
                  },
                  "lineInterpolation": "smooth",
                  "lineStyle": {
                    "fill": "solid"
                  },
                  "lineWidth": 2,
                  "pointSize": 5,
                  "scaleDistribution": {
                    "type": "linear"
                  },
                  "showPoints": "never",
                  "spanNulls": false,
                  "stacking": {
                    "group": "A",
                    "mode": "none"
                  },
                  "thresholdsStyle": {
                    "mode": "off"
                  }
                },
                "mappings": [],
                "thresholds": {
                  "mode": "absolute",
                  "steps": [
                    {
                      "color": "green",
                      "value": null
                    },
                    {
                      "color": "red",
                      "value": 80
                    }
                  ]
                },
                "unit": "short"
              },
              "overrides": []
            },
            "gridPos": {
              "h": 8,
              "w": 12,
              "x": 12,
              "y": 39
            },
            "id": 102,
            "options": {
              "legend": {
                "calcs": [
                  "min",
                  "max",
                  "mean"
                ],
                "displayMode": "list",
                "placement": "right",
                "showLegend": false
              },
              "tooltip": {
                "mode": "multi",
                "sort": "desc"
              }
            },
            "pluginVersion": "8.3.3",
            "targets": [
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "$${datasource}"
                },
                "editorMode": "code",
                "exemplar": true,
                "expr": "sum(rate(prometheus_tsdb_compactions_total{pod=~\"$pod\"}[$__rate_interval])) by (pod)",
                "interval": "",
                "legendFormat": "{{ pod }} - Total Compactions",
                "range": true,
                "refId": "A"
              },
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "$${datasource}"
                },
                "editorMode": "code",
                "expr": "sum(rate(prometheus_tsdb_compactions_triggered_total{pod=~\"$pod\"}[$__rate_interval])) by (pod)",
                "hide": false,
                "legendFormat": "{{ pod }} - Triggered Compactions",
                "range": true,
                "refId": "B"
              },
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "$${datasource}"
                },
                "editorMode": "code",
                "expr": "sum(rate(prometheus_tsdb_compactions_skipped_total{pod=~\"$pod\"}[$__rate_interval])) by (pod)",
                "hide": false,
                "legendFormat": "{{ pod }} - Skipped Compactions",
                "range": true,
                "refId": "C"
              },
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "$${datasource}"
                },
                "editorMode": "code",
                "expr": "sum(rate(prometheus_tsdb_compactions_failed_total{pod=~\"$pod\"}[$__rate_interval])) by (pod)",
                "hide": false,
                "legendFormat": "{{ pod }} - Failed Compactions",
                "range": true,
                "refId": "D"
              }
            ],
            "title": "TSDB Rate of Compactions by pod",
            "type": "timeseries"
          },
          {
            "datasource": {
              "type": "prometheus",
              "uid": "$${datasource}"
            },
            "fieldConfig": {
              "defaults": {
                "color": {
                  "mode": "palette-classic"
                },
                "custom": {
                  "axisCenteredZero": false,
                  "axisColorMode": "text",
                  "axisLabel": "",
                  "axisPlacement": "auto",
                  "barAlignment": 0,
                  "drawStyle": "line",
                  "fillOpacity": 25,
                  "gradientMode": "opacity",
                  "hideFrom": {
                    "legend": false,
                    "tooltip": false,
                    "viz": false
                  },
                  "lineInterpolation": "smooth",
                  "lineStyle": {
                    "fill": "solid"
                  },
                  "lineWidth": 2,
                  "pointSize": 5,
                  "scaleDistribution": {
                    "type": "linear"
                  },
                  "showPoints": "never",
                  "spanNulls": false,
                  "stacking": {
                    "group": "A",
                    "mode": "none"
                  },
                  "thresholdsStyle": {
                    "mode": "off"
                  }
                },
                "mappings": [],
                "thresholds": {
                  "mode": "absolute",
                  "steps": [
                    {
                      "color": "green",
                      "value": null
                    },
                    {
                      "color": "red",
                      "value": 80
                    }
                  ]
                },
                "unit": "short"
              },
              "overrides": []
            },
            "gridPos": {
              "h": 8,
              "w": 12,
              "x": 0,
              "y": 47
            },
            "id": 90,
            "options": {
              "legend": {
                "calcs": [
                  "min",
                  "max",
                  "mean"
                ],
                "displayMode": "list",
                "placement": "right",
                "showLegend": false
              },
              "tooltip": {
                "mode": "multi",
                "sort": "desc"
              }
            },
            "pluginVersion": "8.3.3",
            "targets": [
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "$${datasource}"
                },
                "editorMode": "code",
                "exemplar": true,
                "expr": "sum(rate(prometheus_tsdb_reloads_failures_total{pod=~\"$pod\"}[$__rate_interval])) by (pod)",
                "interval": "",
                "legendFormat": "{{ pod }}",
                "range": true,
                "refId": "A"
              }
            ],
            "title": "TSDB Reload Failures by pod",
            "type": "timeseries"
          },
          {
            "datasource": {
              "type": "prometheus",
              "uid": "$${datasource}"
            },
            "fieldConfig": {
              "defaults": {
                "color": {
                  "mode": "palette-classic"
                },
                "custom": {
                  "axisCenteredZero": false,
                  "axisColorMode": "text",
                  "axisLabel": "",
                  "axisPlacement": "auto",
                  "barAlignment": 0,
                  "drawStyle": "line",
                  "fillOpacity": 25,
                  "gradientMode": "opacity",
                  "hideFrom": {
                    "legend": false,
                    "tooltip": false,
                    "viz": false
                  },
                  "lineInterpolation": "smooth",
                  "lineStyle": {
                    "fill": "solid"
                  },
                  "lineWidth": 2,
                  "pointSize": 5,
                  "scaleDistribution": {
                    "type": "linear"
                  },
                  "showPoints": "never",
                  "spanNulls": false,
                  "stacking": {
                    "group": "A",
                    "mode": "none"
                  },
                  "thresholdsStyle": {
                    "mode": "off"
                  }
                },
                "mappings": [],
                "thresholds": {
                  "mode": "absolute",
                  "steps": [
                    {
                      "color": "green",
                      "value": null
                    },
                    {
                      "color": "red",
                      "value": 80
                    }
                  ]
                },
                "unit": "short"
              },
              "overrides": []
            },
            "gridPos": {
              "h": 8,
              "w": 12,
              "x": 12,
              "y": 47
            },
            "id": 95,
            "options": {
              "legend": {
                "calcs": [
                  "min",
                  "max",
                  "mean"
                ],
                "displayMode": "list",
                "placement": "right",
                "showLegend": false
              },
              "tooltip": {
                "mode": "multi",
                "sort": "desc"
              }
            },
            "pluginVersion": "8.3.3",
            "targets": [
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "$${datasource}"
                },
                "editorMode": "code",
                "exemplar": true,
                "expr": "sum(rate(prometheus_tsdb_head_series_created_total{pod=~\"$pod\"}[$__rate_interval])) by (pod)",
                "interval": "",
                "legendFormat": "{{ pod }} - Created series",
                "range": true,
                "refId": "A"
              },
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "$${datasource}"
                },
                "editorMode": "code",
                "expr": "sum(rate(prometheus_tsdb_head_series_removed_total{pod=~\"$pod\"}[$__rate_interval])) by (pod)",
                "hide": false,
                "legendFormat": "{{ pod }} - Deleted series",
                "range": true,
                "refId": "B"
              }
            ],
            "title": "TSDB Created & Deleted series by pod",
            "type": "timeseries"
          },
          {
            "datasource": {
              "type": "prometheus",
              "uid": "$${datasource}"
            },
            "fieldConfig": {
              "defaults": {
                "color": {
                  "mode": "palette-classic"
                },
                "custom": {
                  "axisCenteredZero": false,
                  "axisColorMode": "text",
                  "axisLabel": "",
                  "axisPlacement": "auto",
                  "barAlignment": 0,
                  "drawStyle": "line",
                  "fillOpacity": 25,
                  "gradientMode": "opacity",
                  "hideFrom": {
                    "legend": false,
                    "tooltip": false,
                    "viz": false
                  },
                  "lineInterpolation": "smooth",
                  "lineStyle": {
                    "fill": "solid"
                  },
                  "lineWidth": 2,
                  "pointSize": 5,
                  "scaleDistribution": {
                    "type": "linear"
                  },
                  "showPoints": "never",
                  "spanNulls": false,
                  "stacking": {
                    "group": "A",
                    "mode": "none"
                  },
                  "thresholdsStyle": {
                    "mode": "off"
                  }
                },
                "mappings": [],
                "thresholds": {
                  "mode": "absolute",
                  "steps": [
                    {
                      "color": "green",
                      "value": null
                    },
                    {
                      "color": "red",
                      "value": 80
                    }
                  ]
                },
                "unit": "none"
              },
              "overrides": []
            },
            "gridPos": {
              "h": 8,
              "w": 12,
              "x": 0,
              "y": 55
            },
            "id": 73,
            "options": {
              "legend": {
                "calcs": [
                  "min",
                  "max",
                  "mean"
                ],
                "displayMode": "list",
                "placement": "right",
                "showLegend": false
              },
              "tooltip": {
                "mode": "multi",
                "sort": "desc"
              }
            },
            "pluginVersion": "8.3.3",
            "targets": [
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "$${datasource}"
                },
                "editorMode": "code",
                "exemplar": true,
                "expr": "sum(rate(prometheus_engine_query_duration_seconds_count{pod=~\"$pod\", slice=\"inner_eval\"}[$__rate_interval])) by (pod)",
                "interval": "",
                "legendFormat": "{{ pod }}",
                "range": true,
                "refId": "A"
              }
            ],
            "title": "Engine Query Count by pod",
            "type": "timeseries"
          },
          {
            "datasource": {
              "type": "prometheus",
              "uid": "$${datasource}"
            },
            "fieldConfig": {
              "defaults": {
                "color": {
                  "mode": "palette-classic"
                },
                "custom": {
                  "axisCenteredZero": false,
                  "axisColorMode": "text",
                  "axisLabel": "",
                  "axisPlacement": "auto",
                  "barAlignment": 0,
                  "drawStyle": "line",
                  "fillOpacity": 25,
                  "gradientMode": "opacity",
                  "hideFrom": {
                    "legend": false,
                    "tooltip": false,
                    "viz": false
                  },
                  "lineInterpolation": "smooth",
                  "lineStyle": {
                    "fill": "solid"
                  },
                  "lineWidth": 2,
                  "pointSize": 5,
                  "scaleDistribution": {
                    "type": "linear"
                  },
                  "showPoints": "never",
                  "spanNulls": false,
                  "stacking": {
                    "group": "A",
                    "mode": "none"
                  },
                  "thresholdsStyle": {
                    "mode": "off"
                  }
                },
                "mappings": [],
                "thresholds": {
                  "mode": "absolute",
                  "steps": [
                    {
                      "color": "green",
                      "value": null
                    },
                    {
                      "color": "red",
                      "value": 80
                    }
                  ]
                },
                "unit": "ms"
              },
              "overrides": []
            },
            "gridPos": {
              "h": 8,
              "w": 12,
              "x": 12,
              "y": 55
            },
            "id": 86,
            "options": {
              "legend": {
                "calcs": [
                  "min",
                  "max",
                  "mean"
                ],
                "displayMode": "list",
                "placement": "right",
                "showLegend": false
              },
              "tooltip": {
                "mode": "multi",
                "sort": "desc"
              }
            },
            "pluginVersion": "8.3.3",
            "targets": [
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "$${datasource}"
                },
                "editorMode": "code",
                "exemplar": true,
                "expr": "max(prometheus_engine_query_duration_seconds{pod=~\"$pod\"}) by (pod, slice) * 1000",
                "interval": "",
                "legendFormat": "{{ pod }} - {{ slice }}",
                "range": true,
                "refId": "A"
              }
            ],
            "title": "Engine Query Duration by pod, slice",
            "type": "timeseries"
          },
          {
            "collapsed": false,
            "datasource": {
              "type": "datasource",
              "uid": "grafana"
            },
            "gridPos": {
              "h": 1,
              "w": 24,
              "x": 0,
              "y": 63
            },
            "id": 47,
            "panels": [],
            "targets": [
              {
                "datasource": {
                  "type": "datasource",
                  "uid": "grafana"
                },
                "refId": "A"
              }
            ],
            "title": "Resources",
            "type": "row"
          },
          {
            "datasource": {
              "type": "prometheus",
              "uid": "$${datasource}"
            },
            "fieldConfig": {
              "defaults": {
                "color": {
                  "mode": "palette-classic"
                },
                "custom": {
                  "axisCenteredZero": false,
                  "axisColorMode": "text",
                  "axisLabel": "CPU Cores",
                  "axisPlacement": "auto",
                  "barAlignment": 0,
                  "drawStyle": "line",
                  "fillOpacity": 25,
                  "gradientMode": "opacity",
                  "hideFrom": {
                    "legend": false,
                    "tooltip": false,
                    "viz": false
                  },
                  "lineInterpolation": "smooth",
                  "lineWidth": 2,
                  "pointSize": 5,
                  "scaleDistribution": {
                    "type": "linear"
                  },
                  "showPoints": "never",
                  "spanNulls": true,
                  "stacking": {
                    "group": "A",
                    "mode": "none"
                  },
                  "thresholdsStyle": {
                    "mode": "off"
                  }
                },
                "decimals": 4,
                "mappings": [],
                "thresholds": {
                  "mode": "absolute",
                  "steps": [
                    {
                      "color": "green",
                      "value": null
                    },
                    {
                      "color": "red",
                      "value": 80
                    }
                  ]
                },
                "unit": "none"
              },
              "overrides": [
                {
                  "matcher": {
                    "id": "byName",
                    "options": "limit"
                  },
                  "properties": [
                    {
                      "id": "color",
                      "value": {
                        "fixedColor": "#F2495C",
                        "mode": "fixed"
                      }
                    },
                    {
                      "id": "custom.fillOpacity",
                      "value": 0
                    }
                  ]
                }
              ]
            },
            "gridPos": {
              "h": 8,
              "w": 12,
              "x": 0,
              "y": 64
            },
            "id": 29,
            "options": {
              "legend": {
                "calcs": [
                  "min",
                  "max",
                  "mean"
                ],
                "displayMode": "table",
                "placement": "right",
                "showLegend": false
              },
              "tooltip": {
                "mode": "multi",
                "sort": "desc"
              }
            },
            "pluginVersion": "8.3.3",
            "targets": [
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "$${datasource}"
                },
                "editorMode": "code",
                "exemplar": true,
                "expr": "sum(rate(container_cpu_usage_seconds_total{pod=~\"$pod\", image!=\"\", container!=\"\"}[$__rate_interval])) by (pod, container)",
                "interval": "$resolution",
                "legendFormat": "{{ pod }} - {{ container }}",
                "range": true,
                "refId": "A"
              }
            ],
            "title": "CPU Usage by pod, container",
            "type": "timeseries"
          },
          {
            "datasource": {
              "type": "prometheus",
              "uid": "$${datasource}"
            },
            "fieldConfig": {
              "defaults": {
                "color": {
                  "mode": "palette-classic"
                },
                "custom": {
                  "axisCenteredZero": false,
                  "axisColorMode": "text",
                  "axisLabel": "Bytes",
                  "axisPlacement": "auto",
                  "barAlignment": 0,
                  "drawStyle": "line",
                  "fillOpacity": 25,
                  "gradientMode": "opacity",
                  "hideFrom": {
                    "legend": false,
                    "tooltip": false,
                    "viz": false
                  },
                  "lineInterpolation": "smooth",
                  "lineStyle": {
                    "fill": "solid"
                  },
                  "lineWidth": 2,
                  "pointSize": 5,
                  "scaleDistribution": {
                    "type": "linear"
                  },
                  "showPoints": "never",
                  "spanNulls": true,
                  "stacking": {
                    "group": "A",
                    "mode": "none"
                  },
                  "thresholdsStyle": {
                    "mode": "off"
                  }
                },
                "decimals": 2,
                "mappings": [],
                "thresholds": {
                  "mode": "absolute",
                  "steps": [
                    {
                      "color": "green",
                      "value": null
                    },
                    {
                      "color": "red",
                      "value": 80
                    }
                  ]
                },
                "unit": "bytes"
              },
              "overrides": []
            },
            "gridPos": {
              "h": 8,
              "w": 12,
              "x": 12,
              "y": 64
            },
            "id": 51,
            "options": {
              "legend": {
                "calcs": [
                  "min",
                  "max",
                  "mean"
                ],
                "displayMode": "table",
                "placement": "right",
                "showLegend": false
              },
              "tooltip": {
                "mode": "multi",
                "sort": "desc"
              }
            },
            "pluginVersion": "8.3.3",
            "targets": [
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "$${datasource}"
                },
                "editorMode": "code",
                "exemplar": true,
                "expr": "sum(container_memory_working_set_bytes{pod=~\"$pod\", image!=\"\", container!=\"\"}) by (pod, container)",
                "interval": "",
                "legendFormat": "{{ pod }} - {{ container }}",
                "range": true,
                "refId": "A"
              }
            ],
            "title": "Memory Usage by container",
            "type": "timeseries"
          },
          {
            "collapsed": false,
            "datasource": {
              "type": "prometheus",
              "uid": "prometheus"
            },
            "gridPos": {
              "h": 1,
              "w": 24,
              "x": 0,
              "y": 72
            },
            "id": 66,
            "panels": [],
            "targets": [
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "prometheus"
                },
                "refId": "A"
              }
            ],
            "title": "Storage",
            "type": "row"
          },
          {
            "datasource": {
              "type": "prometheus",
              "uid": "$${datasource}"
            },
            "fieldConfig": {
              "defaults": {
                "color": {
                  "mode": "palette-classic"
                },
                "custom": {
                  "axisCenteredZero": false,
                  "axisColorMode": "text",
                  "axisLabel": "",
                  "axisPlacement": "auto",
                  "barAlignment": 0,
                  "drawStyle": "line",
                  "fillOpacity": 25,
                  "gradientMode": "opacity",
                  "hideFrom": {
                    "legend": false,
                    "tooltip": false,
                    "viz": false
                  },
                  "lineInterpolation": "smooth",
                  "lineStyle": {
                    "fill": "solid"
                  },
                  "lineWidth": 2,
                  "pointSize": 5,
                  "scaleDistribution": {
                    "type": "linear"
                  },
                  "showPoints": "never",
                  "spanNulls": true,
                  "stacking": {
                    "group": "A",
                    "mode": "none"
                  },
                  "thresholdsStyle": {
                    "mode": "off"
                  }
                },
                "mappings": [],
                "thresholds": {
                  "mode": "absolute",
                  "steps": [
                    {
                      "color": "green",
                      "value": null
                    },
                    {
                      "color": "red",
                      "value": 80
                    }
                  ]
                },
                "unit": "percentunit"
              },
              "overrides": []
            },
            "gridPos": {
              "h": 8,
              "w": 12,
              "x": 0,
              "y": 73
            },
            "id": 62,
            "options": {
              "legend": {
                "calcs": [
                  "min",
                  "max",
                  "mean"
                ],
                "displayMode": "table",
                "placement": "right",
                "showLegend": true
              },
              "tooltip": {
                "mode": "multi",
                "sort": "desc"
              }
            },
            "pluginVersion": "8.3.3",
            "targets": [
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "$${datasource}"
                },
                "editorMode": "code",
                "exemplar": true,
                "expr": "sum(kubelet_volume_stats_used_bytes{persistentvolumeclaim=~\".*prom.*\"}) by (persistentvolumeclaim) / sum(kubelet_volume_stats_capacity_bytes{persistentvolumeclaim=~\".*prom.*\"}) by (persistentvolumeclaim)",
                "interval": "",
                "legendFormat": "{{ persistentvolumeclaim }}",
                "range": true,
                "refId": "A"
              }
            ],
            "title": "Persistent Volumes - Capacity and usage in %",
            "type": "timeseries"
          },
          {
            "datasource": {
              "type": "prometheus",
              "uid": "$${datasource}"
            },
            "fieldConfig": {
              "defaults": {
                "color": {
                  "mode": "palette-classic"
                },
                "custom": {
                  "axisCenteredZero": false,
                  "axisColorMode": "text",
                  "axisLabel": "",
                  "axisPlacement": "auto",
                  "barAlignment": 0,
                  "drawStyle": "line",
                  "fillOpacity": 25,
                  "gradientMode": "opacity",
                  "hideFrom": {
                    "legend": false,
                    "tooltip": false,
                    "viz": false
                  },
                  "lineInterpolation": "smooth",
                  "lineStyle": {
                    "fill": "solid"
                  },
                  "lineWidth": 2,
                  "pointSize": 5,
                  "scaleDistribution": {
                    "type": "linear"
                  },
                  "showPoints": "never",
                  "spanNulls": true,
                  "stacking": {
                    "group": "A",
                    "mode": "none"
                  },
                  "thresholdsStyle": {
                    "mode": "off"
                  }
                },
                "mappings": [],
                "thresholds": {
                  "mode": "absolute",
                  "steps": [
                    {
                      "color": "green",
                      "value": null
                    },
                    {
                      "color": "red",
                      "value": 80
                    }
                  ]
                },
                "unit": "bytes"
              },
              "overrides": []
            },
            "gridPos": {
              "h": 8,
              "w": 12,
              "x": 12,
              "y": 73
            },
            "id": 87,
            "options": {
              "legend": {
                "calcs": [
                  "min",
                  "max",
                  "mean"
                ],
                "displayMode": "table",
                "placement": "right",
                "showLegend": true
              },
              "tooltip": {
                "mode": "multi",
                "sort": "desc"
              }
            },
            "pluginVersion": "8.3.3",
            "targets": [
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "$${datasource}"
                },
                "editorMode": "code",
                "exemplar": true,
                "expr": "sum(kubelet_volume_stats_used_bytes{persistentvolumeclaim=~\".*prom.*\"}) by (persistentvolumeclaim)",
                "interval": "",
                "legendFormat": "{{ persistentvolumeclaim }} - Used",
                "range": true,
                "refId": "A"
              },
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "$${datasource}"
                },
                "editorMode": "code",
                "exemplar": true,
                "expr": "sum(kubelet_volume_stats_capacity_bytes{persistentvolumeclaim=~\".*prom.*\"}) by (persistentvolumeclaim)",
                "hide": false,
                "legendFormat": "{{ persistentvolumeclaim }} - Capacity",
                "range": true,
                "refId": "B"
              }
            ],
            "title": "Persistent Volumes - Capacity and usage in bytes",
            "type": "timeseries"
          },
          {
            "datasource": {
              "type": "prometheus",
              "uid": "$${datasource}"
            },
            "fieldConfig": {
              "defaults": {
                "color": {
                  "mode": "palette-classic"
                },
                "custom": {
                  "axisCenteredZero": false,
                  "axisColorMode": "text",
                  "axisLabel": "",
                  "axisPlacement": "auto",
                  "barAlignment": 0,
                  "drawStyle": "line",
                  "fillOpacity": 25,
                  "gradientMode": "opacity",
                  "hideFrom": {
                    "legend": false,
                    "tooltip": false,
                    "viz": false
                  },
                  "lineInterpolation": "smooth",
                  "lineWidth": 2,
                  "pointSize": 5,
                  "scaleDistribution": {
                    "type": "linear"
                  },
                  "showPoints": "never",
                  "spanNulls": true,
                  "stacking": {
                    "group": "A",
                    "mode": "none"
                  },
                  "thresholdsStyle": {
                    "mode": "off"
                  }
                },
                "links": [],
                "mappings": [],
                "thresholds": {
                  "mode": "absolute",
                  "steps": [
                    {
                      "color": "green",
                      "value": null
                    },
                    {
                      "color": "red",
                      "value": 80
                    }
                  ]
                },
                "unit": "percentunit"
              },
              "overrides": []
            },
            "gridPos": {
              "h": 8,
              "w": 12,
              "x": 0,
              "y": 81
            },
            "id": 68,
            "links": [],
            "options": {
              "legend": {
                "calcs": [],
                "displayMode": "table",
                "placement": "right",
                "showLegend": true
              },
              "tooltip": {
                "mode": "multi",
                "sort": "none"
              }
            },
            "pluginVersion": "8.3.4",
            "targets": [
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "$${datasource}"
                },
                "editorMode": "code",
                "exemplar": true,
                "expr": "1 - sum(kubelet_volume_stats_inodes_used{persistentvolumeclaim=~\".*prom.*\"}) by (persistentvolumeclaim) / sum(kubelet_volume_stats_inodes{persistentvolumeclaim=~\".*prom.*\"}) by (persistentvolumeclaim)",
                "format": "time_series",
                "interval": "",
                "intervalFactor": 1,
                "legendFormat": "{{ persistentvolumeclaim }}",
                "range": true,
                "refId": "A",
                "step": 240
              }
            ],
            "title": "Persistent Volumes - Inodes",
            "type": "timeseries"
          },
          {
            "collapsed": false,
            "datasource": {
              "type": "datasource",
              "uid": "grafana"
            },
            "gridPos": {
              "h": 1,
              "w": 24,
              "x": 0,
              "y": 89
            },
            "id": 45,
            "panels": [],
            "targets": [
              {
                "datasource": {
                  "type": "datasource",
                  "uid": "grafana"
                },
                "refId": "A"
              }
            ],
            "title": "Network",
            "type": "row"
          },
          {
            "datasource": {
              "type": "prometheus",
              "uid": "$${datasource}"
            },
            "fieldConfig": {
              "defaults": {
                "color": {
                  "mode": "palette-classic"
                },
                "custom": {
                  "axisCenteredZero": false,
                  "axisColorMode": "text",
                  "axisLabel": "",
                  "axisPlacement": "auto",
                  "barAlignment": 0,
                  "drawStyle": "line",
                  "fillOpacity": 25,
                  "gradientMode": "opacity",
                  "hideFrom": {
                    "legend": false,
                    "tooltip": false,
                    "viz": false
                  },
                  "lineInterpolation": "smooth",
                  "lineWidth": 2,
                  "pointSize": 5,
                  "scaleDistribution": {
                    "type": "linear"
                  },
                  "showPoints": "never",
                  "spanNulls": true,
                  "stacking": {
                    "group": "A",
                    "mode": "none"
                  },
                  "thresholdsStyle": {
                    "mode": "off"
                  }
                },
                "mappings": [],
                "thresholds": {
                  "mode": "absolute",
                  "steps": [
                    {
                      "color": "green",
                      "value": null
                    },
                    {
                      "color": "red",
                      "value": 80
                    }
                  ]
                },
                "unit": "bytes"
              },
              "overrides": []
            },
            "gridPos": {
              "h": 8,
              "w": 12,
              "x": 0,
              "y": 90
            },
            "id": 31,
            "options": {
              "legend": {
                "calcs": [],
                "displayMode": "list",
                "placement": "bottom",
                "showLegend": false
              },
              "tooltip": {
                "mode": "multi",
                "sort": "none"
              }
            },
            "pluginVersion": "8.3.3",
            "targets": [
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "$${datasource}"
                },
                "editorMode": "code",
                "exemplar": true,
                "expr": "sum(rate(container_network_receive_bytes_total{pod=~\"$pod\"}[$__rate_interval])) by (pod)",
                "interval": "$resolution",
                "legendFormat": "{{ pod }} - Received",
                "range": true,
                "refId": "A"
              },
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "$${datasource}"
                },
                "editorMode": "code",
                "exemplar": true,
                "expr": "- sum(rate(container_network_transmit_bytes_total{pod=~\"$pod\"}[$__rate_interval])) by (pod)",
                "interval": "$resolution",
                "legendFormat": "{{ pod }} - Transmitted",
                "range": true,
                "refId": "B"
              }
            ],
            "title": "Network - Bandwidth by pod",
            "type": "timeseries"
          },
          {
            "datasource": {
              "type": "prometheus",
              "uid": "$${datasource}"
            },
            "fieldConfig": {
              "defaults": {
                "color": {
                  "mode": "palette-classic"
                },
                "custom": {
                  "axisCenteredZero": false,
                  "axisColorMode": "text",
                  "axisLabel": "",
                  "axisPlacement": "auto",
                  "barAlignment": 0,
                  "drawStyle": "line",
                  "fillOpacity": 25,
                  "gradientMode": "opacity",
                  "hideFrom": {
                    "legend": false,
                    "tooltip": false,
                    "viz": false
                  },
                  "lineInterpolation": "smooth",
                  "lineWidth": 2,
                  "pointSize": 5,
                  "scaleDistribution": {
                    "type": "linear"
                  },
                  "showPoints": "never",
                  "spanNulls": true,
                  "stacking": {
                    "group": "A",
                    "mode": "none"
                  },
                  "thresholdsStyle": {
                    "mode": "off"
                  }
                },
                "mappings": [],
                "thresholds": {
                  "mode": "absolute",
                  "steps": [
                    {
                      "color": "green",
                      "value": null
                    },
                    {
                      "color": "red",
                      "value": 80
                    }
                  ]
                },
                "unit": "pps"
              },
              "overrides": []
            },
            "gridPos": {
              "h": 8,
              "w": 12,
              "x": 12,
              "y": 90
            },
            "id": 34,
            "options": {
              "legend": {
                "calcs": [],
                "displayMode": "list",
                "placement": "bottom",
                "showLegend": false
              },
              "tooltip": {
                "mode": "multi",
                "sort": "none"
              }
            },
            "pluginVersion": "8.3.3",
            "targets": [
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "$${datasource}"
                },
                "editorMode": "code",
                "exemplar": true,
                "expr": "sum(rate(container_network_receive_packets_total{pod=~\"$pod\"}[$__rate_interval])) by (pod)",
                "interval": "$resolution",
                "legendFormat": "{{ pod }} - Received",
                "range": true,
                "refId": "A"
              },
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "$${datasource}"
                },
                "editorMode": "code",
                "exemplar": true,
                "expr": "- sum(rate(container_network_transmit_packets_total{pod=~\"$pod\"}[$__rate_interval])) by (pod)",
                "interval": "$resolution",
                "legendFormat": "{{ pod }} - Transmitted",
                "range": true,
                "refId": "B"
              }
            ],
            "title": "Network - Packets rate by pod",
            "type": "timeseries"
          },
          {
            "datasource": {
              "type": "prometheus",
              "uid": "$${datasource}"
            },
            "fieldConfig": {
              "defaults": {
                "color": {
                  "mode": "palette-classic"
                },
                "custom": {
                  "axisCenteredZero": false,
                  "axisColorMode": "text",
                  "axisLabel": "",
                  "axisPlacement": "auto",
                  "barAlignment": 0,
                  "drawStyle": "line",
                  "fillOpacity": 25,
                  "gradientMode": "opacity",
                  "hideFrom": {
                    "legend": false,
                    "tooltip": false,
                    "viz": false
                  },
                  "lineInterpolation": "smooth",
                  "lineWidth": 2,
                  "pointSize": 5,
                  "scaleDistribution": {
                    "type": "linear"
                  },
                  "showPoints": "never",
                  "spanNulls": true,
                  "stacking": {
                    "group": "A",
                    "mode": "none"
                  },
                  "thresholdsStyle": {
                    "mode": "off"
                  }
                },
                "mappings": [],
                "thresholds": {
                  "mode": "absolute",
                  "steps": [
                    {
                      "color": "green",
                      "value": null
                    },
                    {
                      "color": "red",
                      "value": 80
                    }
                  ]
                },
                "unit": "pps"
              },
              "overrides": []
            },
            "gridPos": {
              "h": 8,
              "w": 12,
              "x": 0,
              "y": 98
            },
            "id": 36,
            "options": {
              "legend": {
                "calcs": [],
                "displayMode": "list",
                "placement": "bottom",
                "showLegend": false
              },
              "tooltip": {
                "mode": "multi",
                "sort": "none"
              }
            },
            "pluginVersion": "8.3.3",
            "targets": [
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "$${datasource}"
                },
                "editorMode": "code",
                "exemplar": true,
                "expr": "sum(rate(container_network_receive_packets_dropped_total{pod=~\"$pod\"}[$__rate_interval])) by (pod)",
                "interval": "$resolution",
                "legendFormat": "{{ pod }} - Received",
                "range": true,
                "refId": "A"
              },
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "$${datasource}"
                },
                "editorMode": "code",
                "exemplar": true,
                "expr": "- sum(rate(container_network_transmit_packets_dropped_total{pod=~\"$pod\"}[$__rate_interval])) by (pod)",
                "interval": "$resolution",
                "legendFormat": "{{ pod }} - Transmitted",
                "range": true,
                "refId": "B"
              }
            ],
            "title": "Network - Packets Dropped by pod",
            "type": "timeseries"
          },
          {
            "datasource": {
              "type": "prometheus",
              "uid": "$${datasource}"
            },
            "fieldConfig": {
              "defaults": {
                "color": {
                  "mode": "palette-classic"
                },
                "custom": {
                  "axisCenteredZero": false,
                  "axisColorMode": "text",
                  "axisLabel": "",
                  "axisPlacement": "auto",
                  "barAlignment": 0,
                  "drawStyle": "line",
                  "fillOpacity": 25,
                  "gradientMode": "opacity",
                  "hideFrom": {
                    "legend": false,
                    "tooltip": false,
                    "viz": false
                  },
                  "lineInterpolation": "smooth",
                  "lineWidth": 2,
                  "pointSize": 5,
                  "scaleDistribution": {
                    "type": "linear"
                  },
                  "showPoints": "never",
                  "spanNulls": true,
                  "stacking": {
                    "group": "A",
                    "mode": "none"
                  },
                  "thresholdsStyle": {
                    "mode": "off"
                  }
                },
                "mappings": [],
                "thresholds": {
                  "mode": "absolute",
                  "steps": [
                    {
                      "color": "green",
                      "value": null
                    },
                    {
                      "color": "red",
                      "value": 80
                    }
                  ]
                },
                "unit": "pps"
              },
              "overrides": []
            },
            "gridPos": {
              "h": 8,
              "w": 12,
              "x": 12,
              "y": 98
            },
            "id": 37,
            "options": {
              "legend": {
                "calcs": [],
                "displayMode": "list",
                "placement": "bottom",
                "showLegend": false
              },
              "tooltip": {
                "mode": "multi",
                "sort": "none"
              }
            },
            "pluginVersion": "8.3.3",
            "targets": [
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "$${datasource}"
                },
                "editorMode": "code",
                "exemplar": true,
                "expr": "sum(rate(container_network_receive_errors_total{pod=~\"$pod\"}[$__rate_interval])) by (pod)",
                "interval": "$resolution",
                "legendFormat": "{{ pod }} - Received",
                "range": true,
                "refId": "A"
              },
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "$${datasource}"
                },
                "editorMode": "code",
                "exemplar": true,
                "expr": "- sum(rate(container_network_transmit_errors_total{pod=~\"$pod\"}[$__rate_interval])) by (pod)",
                "interval": "$resolution",
                "legendFormat": "{{ pod }} - Transmitted",
                "range": true,
                "refId": "B"
              }
            ],
            "title": "Network - Errors by pod",
            "type": "timeseries"
          }
        ],
        "refresh": "30s",
        "revision": 1,
        "schemaVersion": 38,
        "style": "dark",
        "tags": [
          "Kubernetes",
          "Prometheus"
        ],
        "templating": {
          "list": [
            {
              "current": {
                "selected": true,
                "text": "Prometheus",
                "value": "Prometheus"
              },
              "hide": 0,
              "includeAll": false,
              "multi": false,
              "name": "datasource",
              "options": [],
              "query": "prometheus",
              "queryValue": "",
              "refresh": 1,
              "regex": "",
              "skipUrlSync": false,
              "type": "datasource"
            },
            {
              "current": {
                "selected": false,
                "text": "All",
                "value": "$__all"
              },
              "datasource": {
                "type": "prometheus",
                "uid": "$${datasource}"
              },
              "definition": "label_values(prometheus_build_info, pod)",
              "hide": 0,
              "includeAll": true,
              "multi": false,
              "name": "pod",
              "options": [],
              "query": {
                "query": "label_values(prometheus_build_info, pod)",
                "refId": "StandardVariableQuery"
              },
              "refresh": 2,
              "regex": "",
              "skipUrlSync": false,
              "sort": 1,
              "tagValuesQuery": "",
              "tagsQuery": "",
              "type": "query",
              "useTags": false
            },
            {
              "current": {
                "selected": false,
                "text": "30s",
                "value": "30s"
              },
              "hide": 0,
              "includeAll": false,
              "multi": false,
              "name": "resolution",
              "options": [
                {
                  "selected": false,
                  "text": "1s",
                  "value": "1s"
                },
                {
                  "selected": false,
                  "text": "15s",
                  "value": "15s"
                },
                {
                  "selected": true,
                  "text": "30s",
                  "value": "30s"
                },
                {
                  "selected": false,
                  "text": "1m",
                  "value": "1m"
                },
                {
                  "selected": false,
                  "text": "3m",
                  "value": "3m"
                },
                {
                  "selected": false,
                  "text": "5m",
                  "value": "5m"
                }
              ],
              "query": "1s, 15s, 30s, 1m, 3m, 5m",
              "queryValue": "",
              "skipUrlSync": false,
              "type": "custom"
            }
          ]
        },
        "time": {
          "from": "now-15m",
          "to": "now"
        },
        "timepicker": {},
        "timezone": "",
        "title": "Prometheus",
        "uid": "k8s_addons_prometheus",
        "version": 1,
        "weekStart": ""
      }
      EOT
    }
    "kind" = "ConfigMap"
    "metadata" = {
      "annotations" = {
        "grafana_folder" = "Kubernetes"
      }
      "labels" = {
        "grafana_dashboard" = "1"
      }
      "name"      = "dashboards-k8s-addons-prometheus"
      "namespace" = "prometheus"
    }
  }
}

resource "kubernetes_manifest" "configmap_prometheus_dashboards_k8s_addons_trivy_operator" {
  manifest = {
    "apiVersion" = "v1"
    "data" = {
      "k8s-addons-trivy-operator.json" = <<-EOT
      {
          "__inputs": [
            {
              "name": "DS_PROMETHEUS",
              "label": "Prometheus",
              "description": "",
              "type": "datasource",
              "pluginId": "prometheus",
              "pluginName": "Prometheus"
            }
          ],
          "__elements": [],
          "__requires": [
            {
              "type": "grafana",
              "id": "grafana",
              "name": "Grafana",
              "version": "8.5.0"
            },
            {
              "type": "datasource",
              "id": "prometheus",
              "name": "Prometheus",
              "version": "5.0.0"
            },
            {
              "type": "panel",
              "id": "timeseries",
              "name": "Time series",
              "version": ""
            },
            {
              "type": "panel",
              "id": "stat",
              "name": "Stat",
              "version": ""
            },
            {
              "type": "panel",
              "id": "table",
              "name": "Table",
              "version": ""
            }
          ],
        "annotations": {
          "list": [
            {
              "builtIn": 1,
              "datasource": {
                "type": "datasource",
                "uid": "grafana"
              },
              "enable": true,
              "hide": true,
              "iconColor": "rgba(0, 211, 255, 1)",
              "name": "Annotations & Alerts",
              "target": {
                "limit": 100,
                "matchAny": false,
                "tags": [],
                "type": "dashboard"
              },
              "type": "dashboard"
            }
          ]
        },
        "description": "This is a modern dashboard for the Trivy Operator from Aqua Security. Made to take advantage of the latest Grafana features. GitHub repository: https://github.com/dotdc/grafana-dashboards-kubernetes",
        "editable": true,
        "fiscalYearStartMonth": 0,
        "graphTooltip": 1,
        "links": [],
        "liveNow": false,
        "panels": [
          {
            "collapsed": false,
            "datasource": {
              "type": "datasource",
              "uid": "grafana"
            },
            "gridPos": {
              "h": 1,
              "w": 24,
              "x": 0,
              "y": 0
            },
            "id": 43,
            "panels": [],
            "title": "Vulnerabilities",
            "type": "row"
          },
          {
            "datasource": {
              "type": "prometheus",
              "uid": "$${datasource}"
            },
            "fieldConfig": {
              "defaults": {
                "color": {
                  "mode": "thresholds"
                },
                "mappings": [],
                "thresholds": {
                  "mode": "absolute",
                  "steps": [
                    {
                      "color": "green",
                      "value": null
                    },
                    {
                      "color": "red",
                      "value": 1
                    }
                  ]
                },
                "unit": "none"
              },
              "overrides": []
            },
            "gridPos": {
              "h": 4,
              "w": 4,
              "x": 0,
              "y": 1
            },
            "id": 51,
            "options": {
              "colorMode": "value",
              "graphMode": "area",
              "justifyMode": "auto",
              "orientation": "auto",
              "reduceOptions": {
                "calcs": [
                  "last"
                ],
                "fields": "",
                "values": false
              },
              "textMode": "auto"
            },
            "pluginVersion": "9.3.8",
            "targets": [
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "$${datasource}"
                },
                "editorMode": "code",
                "exemplar": false,
                "expr": "sum(trivy_image_vulnerabilities{severity=\"Critical\", namespace=~\"$namespace\"})",
                "instant": true,
                "interval": "$resolution",
                "legendFormat": "__auto",
                "refId": "A"
              }
            ],
            "title": "CRITICAL",
            "type": "stat"
          },
          {
            "datasource": {
              "type": "prometheus",
              "uid": "$${datasource}"
            },
            "fieldConfig": {
              "defaults": {
                "color": {
                  "mode": "thresholds"
                },
                "mappings": [],
                "thresholds": {
                  "mode": "absolute",
                  "steps": [
                    {
                      "color": "green",
                      "value": null
                    },
                    {
                      "color": "orange",
                      "value": 1
                    }
                  ]
                },
                "unit": "none"
              },
              "overrides": []
            },
            "gridPos": {
              "h": 4,
              "w": 4,
              "x": 4,
              "y": 1
            },
            "id": 50,
            "options": {
              "colorMode": "value",
              "graphMode": "area",
              "justifyMode": "auto",
              "orientation": "auto",
              "reduceOptions": {
                "calcs": [
                  "last"
                ],
                "fields": "",
                "values": false
              },
              "textMode": "auto"
            },
            "pluginVersion": "9.3.8",
            "targets": [
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "$${datasource}"
                },
                "editorMode": "code",
                "exemplar": false,
                "expr": "sum(trivy_image_vulnerabilities{severity=\"High\", namespace=~\"$namespace\"})",
                "instant": true,
                "interval": "$resolution",
                "legendFormat": "__auto",
                "refId": "A"
              }
            ],
            "title": "HIGH",
            "type": "stat"
          },
          {
            "datasource": {
              "type": "prometheus",
              "uid": "$${datasource}"
            },
            "fieldConfig": {
              "defaults": {
                "color": {
                  "mode": "thresholds"
                },
                "mappings": [],
                "thresholds": {
                  "mode": "absolute",
                  "steps": [
                    {
                      "color": "green",
                      "value": null
                    },
                    {
                      "color": "yellow",
                      "value": 1
                    }
                  ]
                },
                "unit": "none"
              },
              "overrides": []
            },
            "gridPos": {
              "h": 4,
              "w": 4,
              "x": 8,
              "y": 1
            },
            "id": 49,
            "options": {
              "colorMode": "value",
              "graphMode": "area",
              "justifyMode": "auto",
              "orientation": "auto",
              "reduceOptions": {
                "calcs": [
                  "last"
                ],
                "fields": "",
                "values": false
              },
              "textMode": "auto"
            },
            "pluginVersion": "9.3.8",
            "targets": [
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "$${datasource}"
                },
                "editorMode": "code",
                "exemplar": false,
                "expr": "sum(trivy_image_vulnerabilities{severity=\"Medium\", namespace=~\"$namespace\"})",
                "instant": true,
                "interval": "$resolution",
                "legendFormat": "__auto",
                "refId": "A"
              }
            ],
            "title": "MEDIUM",
            "type": "stat"
          },
          {
            "datasource": {
              "type": "prometheus",
              "uid": "$${datasource}"
            },
            "fieldConfig": {
              "defaults": {
                "color": {
                  "mode": "thresholds"
                },
                "mappings": [],
                "thresholds": {
                  "mode": "absolute",
                  "steps": [
                    {
                      "color": "green",
                      "value": null
                    },
                    {
                      "color": "blue",
                      "value": 1
                    }
                  ]
                },
                "unit": "none"
              },
              "overrides": []
            },
            "gridPos": {
              "h": 4,
              "w": 4,
              "x": 12,
              "y": 1
            },
            "id": 60,
            "options": {
              "colorMode": "value",
              "graphMode": "area",
              "justifyMode": "auto",
              "orientation": "auto",
              "reduceOptions": {
                "calcs": [
                  "last"
                ],
                "fields": "",
                "values": false
              },
              "textMode": "auto"
            },
            "pluginVersion": "9.3.8",
            "targets": [
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "$${datasource}"
                },
                "editorMode": "code",
                "exemplar": false,
                "expr": "sum(trivy_image_vulnerabilities{severity=\"Low\", namespace=~\"$namespace\"})",
                "instant": true,
                "interval": "$resolution",
                "legendFormat": "__auto",
                "refId": "A"
              }
            ],
            "title": "LOW",
            "type": "stat"
          },
          {
            "datasource": {
              "type": "prometheus",
              "uid": "$${datasource}"
            },
            "fieldConfig": {
              "defaults": {
                "color": {
                  "mode": "thresholds"
                },
                "mappings": [],
                "thresholds": {
                  "mode": "absolute",
                  "steps": [
                    {
                      "color": "green",
                      "value": null
                    },
                    {
                      "color": "purple",
                      "value": 1
                    }
                  ]
                },
                "unit": "none"
              },
              "overrides": []
            },
            "gridPos": {
              "h": 4,
              "w": 4,
              "x": 16,
              "y": 1
            },
            "id": 52,
            "options": {
              "colorMode": "value",
              "graphMode": "area",
              "justifyMode": "auto",
              "orientation": "auto",
              "reduceOptions": {
                "calcs": [
                  "last"
                ],
                "fields": "",
                "values": false
              },
              "textMode": "auto"
            },
            "pluginVersion": "9.3.8",
            "targets": [
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "$${datasource}"
                },
                "editorMode": "code",
                "exemplar": false,
                "expr": "sum(trivy_image_vulnerabilities{severity=\"Unknown\", namespace=~\"$namespace\"})",
                "instant": true,
                "interval": "$resolution",
                "legendFormat": "__auto",
                "refId": "A"
              }
            ],
            "title": "UNKNOWN",
            "type": "stat"
          },
          {
            "datasource": {
              "type": "prometheus",
              "uid": "$${datasource}"
            },
            "fieldConfig": {
              "defaults": {
                "color": {
                  "mode": "thresholds"
                },
                "mappings": [],
                "thresholds": {
                  "mode": "absolute",
                  "steps": [
                    {
                      "color": "green",
                      "value": null
                    },
                    {
                      "color": "text",
                      "value": 1
                    }
                  ]
                },
                "unit": "none"
              },
              "overrides": []
            },
            "gridPos": {
              "h": 4,
              "w": 4,
              "x": 20,
              "y": 1
            },
            "id": 39,
            "options": {
              "colorMode": "value",
              "graphMode": "area",
              "justifyMode": "auto",
              "orientation": "auto",
              "reduceOptions": {
                "calcs": [
                  "last"
                ],
                "fields": "",
                "values": false
              },
              "textMode": "auto"
            },
            "pluginVersion": "9.3.8",
            "targets": [
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "$${datasource}"
                },
                "editorMode": "code",
                "exemplar": false,
                "expr": "sum(trivy_image_vulnerabilities{namespace=~\"$namespace\"})",
                "instant": true,
                "interval": "$resolution",
                "legendFormat": "__auto",
                "refId": "A"
              }
            ],
            "title": "TOTAL",
            "type": "stat"
          },
          {
            "datasource": {
              "type": "prometheus",
              "uid": "$${datasource}"
            },
            "fieldConfig": {
              "defaults": {
                "color": {
                  "mode": "palette-classic"
                },
                "custom": {
                  "axisCenteredZero": false,
                  "axisColorMode": "text",
                  "axisLabel": "",
                  "axisPlacement": "auto",
                  "barAlignment": 0,
                  "drawStyle": "line",
                  "fillOpacity": 15,
                  "gradientMode": "opacity",
                  "hideFrom": {
                    "legend": false,
                    "tooltip": false,
                    "viz": false
                  },
                  "lineInterpolation": "linear",
                  "lineWidth": 2,
                  "pointSize": 5,
                  "scaleDistribution": {
                    "type": "linear"
                  },
                  "showPoints": "never",
                  "spanNulls": false,
                  "stacking": {
                    "group": "A",
                    "mode": "none"
                  },
                  "thresholdsStyle": {
                    "mode": "off"
                  }
                },
                "mappings": [],
                "thresholds": {
                  "mode": "absolute",
                  "steps": [
                    {
                      "color": "green",
                      "value": null
                    },
                    {
                      "color": "blue",
                      "value": 1
                    }
                  ]
                },
                "unit": "none"
              },
              "overrides": []
            },
            "gridPos": {
              "h": 8,
              "w": 12,
              "x": 0,
              "y": 5
            },
            "id": 58,
            "options": {
              "legend": {
                "calcs": [],
                "displayMode": "table",
                "placement": "right",
                "showLegend": true
              },
              "tooltip": {
                "mode": "single",
                "sort": "none"
              }
            },
            "pluginVersion": "8.5.0",
            "targets": [
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "$${datasource}"
                },
                "editorMode": "code",
                "exemplar": false,
                "expr": "sum(trivy_image_vulnerabilities) by (namespace)",
                "instant": false,
                "interval": "$resolution",
                "legendFormat": "{{namespace}}",
                "range": true,
                "refId": "A"
              }
            ],
            "title": "Total vulnerabilities by namespaces",
            "type": "timeseries"
          },
          {
            "datasource": {
              "type": "prometheus",
              "uid": "$${datasource}"
            },
            "fieldConfig": {
              "defaults": {
                "color": {
                  "mode": "palette-classic"
                },
                "custom": {
                  "axisCenteredZero": false,
                  "axisColorMode": "text",
                  "axisLabel": "",
                  "axisPlacement": "auto",
                  "barAlignment": 0,
                  "drawStyle": "line",
                  "fillOpacity": 15,
                  "gradientMode": "opacity",
                  "hideFrom": {
                    "legend": false,
                    "tooltip": false,
                    "viz": false
                  },
                  "lineInterpolation": "linear",
                  "lineWidth": 2,
                  "pointSize": 5,
                  "scaleDistribution": {
                    "type": "linear"
                  },
                  "showPoints": "never",
                  "spanNulls": false,
                  "stacking": {
                    "group": "A",
                    "mode": "none"
                  },
                  "thresholdsStyle": {
                    "mode": "off"
                  }
                },
                "mappings": [],
                "thresholds": {
                  "mode": "absolute",
                  "steps": [
                    {
                      "color": "green",
                      "value": null
                    },
                    {
                      "color": "blue",
                      "value": 1
                    }
                  ]
                },
                "unit": "none"
              },
              "overrides": [
                {
                  "matcher": {
                    "id": "byName",
                    "options": "Critical"
                  },
                  "properties": [
                    {
                      "id": "color",
                      "value": {
                        "fixedColor": "red",
                        "mode": "fixed"
                      }
                    }
                  ]
                },
                {
                  "matcher": {
                    "id": "byName",
                    "options": "High"
                  },
                  "properties": [
                    {
                      "id": "color",
                      "value": {
                        "fixedColor": "orange",
                        "mode": "fixed"
                      }
                    }
                  ]
                },
                {
                  "matcher": {
                    "id": "byName",
                    "options": "Medium"
                  },
                  "properties": [
                    {
                      "id": "color",
                      "value": {
                        "fixedColor": "yellow",
                        "mode": "fixed"
                      }
                    }
                  ]
                },
                {
                  "matcher": {
                    "id": "byName",
                    "options": "Low"
                  },
                  "properties": [
                    {
                      "id": "color",
                      "value": {
                        "fixedColor": "blue",
                        "mode": "fixed"
                      }
                    }
                  ]
                },
                {
                  "matcher": {
                    "id": "byName",
                    "options": "Unknown"
                  },
                  "properties": [
                    {
                      "id": "color",
                      "value": {
                        "fixedColor": "purple",
                        "mode": "fixed"
                      }
                    }
                  ]
                }
              ]
            },
            "gridPos": {
              "h": 8,
              "w": 12,
              "x": 12,
              "y": 5
            },
            "id": 61,
            "options": {
              "legend": {
                "calcs": [],
                "displayMode": "table",
                "placement": "right",
                "showLegend": true
              },
              "tooltip": {
                "mode": "multi",
                "sort": "desc"
              }
            },
            "pluginVersion": "8.5.0",
            "targets": [
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "$${datasource}"
                },
                "editorMode": "code",
                "exemplar": false,
                "expr": "sum(trivy_image_vulnerabilities) by (severity)",
                "instant": false,
                "interval": "$resolution",
                "legendFormat": "__auto",
                "range": true,
                "refId": "A"
              }
            ],
            "title": "Total vulnerabilities by severity",
            "type": "timeseries"
          },
          {
            "collapsed": false,
            "gridPos": {
              "h": 1,
              "w": 24,
              "x": 0,
              "y": 13
            },
            "id": 85,
            "panels": [],
            "title": "Vulnerability Details",
            "type": "row"
          },
          {
            "datasource": {
              "type": "prometheus",
              "uid": "prometheus"
            },
            "description": "",
            "fieldConfig": {
              "defaults": {
                "custom": {
                  "align": "auto",
                  "displayMode": "auto",
                  "filterable": true,
                  "inspect": false
                },
                "mappings": [],
                "thresholds": {
                  "mode": "absolute",
                  "steps": [
                    {
                      "color": "green",
                      "value": null
                    },
                    {
                      "color": "orange",
                      "value": 80
                    }
                  ]
                }
              },
              "overrides": [
                {
                  "matcher": {
                    "id": "byName",
                    "options": "severity"
                  },
                  "properties": [
                    {
                      "id": "mappings",
                      "value": [
                        {
                          "options": {
                            "Critical": {
                              "color": "red",
                              "index": 0
                            },
                            "High": {
                              "color": "orange",
                              "index": 1
                            },
                            "Low": {
                              "color": "blue",
                              "index": 3
                            },
                            "Medium": {
                              "color": "yellow",
                              "index": 2
                            },
                            "Unknown": {
                              "color": "purple",
                              "index": 4
                            }
                          },
                          "type": "value"
                        }
                      ]
                    },
                    {
                      "id": "custom.displayMode",
                      "value": "color-text"
                    }
                  ]
                }
              ]
            },
            "gridPos": {
              "h": 12,
              "w": 24,
              "x": 0,
              "y": 14
            },
            "id": 83,
            "options": {
              "footer": {
                "enablePagination": true,
                "fields": [
                  "Value"
                ],
                "reducer": [
                  "sum"
                ],
                "show": false
              },
              "showHeader": true,
              "sortBy": []
            },
            "pluginVersion": "9.3.8",
            "targets": [
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "prometheus"
                },
                "editorMode": "code",
                "exemplar": false,
                "expr": "sum(trivy_image_vulnerabilities{namespace=~\"$namespace\"}) by (namespace, image_registry, image_repository, image_tag, severity) > 0",
                "format": "table",
                "instant": false,
                "legendFormat": "__auto",
                "range": true,
                "refId": "A"
              }
            ],
            "title": "Vulnerability count per image and severity in $namespace namespace(s)",
            "transformations": [
              {
                "id": "organize",
                "options": {
                  "excludeByName": {
                    "Time": true,
                    "Value": false
                  },
                  "indexByName": {
                    "Time": 0,
                    "Value": 6,
                    "image_registry": 2,
                    "image_repository": 3,
                    "image_tag": 4,
                    "namespace": 1,
                    "severity": 5
                  },
                  "renameByName": {
                    "Value": "Nb of vulnerabilities",
                    "image_registry": "Image Registry",
                    "image_repository": "Image Repository",
                    "image_tag": "Image Tag",
                    "namespace": "Namespace",
                    "severity": "Severity"
                  }
                }
              },
              {
                "id": "groupBy",
                "options": {
                  "fields": {
                    "All values": {
                      "aggregations": [],
                      "operation": "groupby"
                    },
                    "Count": {
                      "aggregations": [],
                      "operation": "groupby"
                    },
                    "Image Registry": {
                      "aggregations": [],
                      "operation": "groupby"
                    },
                    "Image Repository": {
                      "aggregations": [],
                      "operation": "groupby"
                    },
                    "Image Tag": {
                      "aggregations": [],
                      "operation": "groupby"
                    },
                    "Namespace": {
                      "aggregations": [],
                      "operation": "groupby"
                    },
                    "Nb of vulnerabilities": {
                      "aggregations": [],
                      "operation": "groupby"
                    },
                    "Severity": {
                      "aggregations": [],
                      "operation": "groupby"
                    },
                    "Value": {
                      "aggregations": [],
                      "operation": "groupby"
                    },
                    "image_registry": {
                      "aggregations": [],
                      "operation": "groupby"
                    },
                    "image_repository": {
                      "aggregations": [],
                      "operation": "groupby"
                    },
                    "image_tag": {
                      "aggregations": [],
                      "operation": "groupby"
                    },
                    "namespace": {
                      "aggregations": [],
                      "operation": "groupby"
                    },
                    "severity": {
                      "aggregations": [],
                      "operation": "groupby"
                    }
                  }
                }
              }
            ],
            "type": "table"
          },
          {
            "datasource": {
              "type": "prometheus",
              "uid": "$${datasource}"
            },
            "description": "Require operator.metricsVulnIdEnabled: true",
            "fieldConfig": {
              "defaults": {
                "color": {
                  "mode": "thresholds"
                },
                "custom": {
                  "align": "auto",
                  "displayMode": "auto",
                  "inspect": false
                },
                "links": [],
                "mappings": [],
                "thresholds": {
                  "mode": "absolute",
                  "steps": [
                    {
                      "color": "green",
                      "value": null
                    },
                    {
                      "color": "blue",
                      "value": 1
                    }
                  ]
                },
                "unit": "none"
              },
              "overrides": [
                {
                  "matcher": {
                    "id": "byName",
                    "options": "severity"
                  },
                  "properties": [
                    {
                      "id": "mappings",
                      "value": [
                        {
                          "options": {
                            "Critical": {
                              "color": "red",
                              "index": 0
                            },
                            "High": {
                              "color": "orange",
                              "index": 1
                            },
                            "Low": {
                              "color": "blue",
                              "index": 3
                            },
                            "Medium": {
                              "color": "yellow",
                              "index": 2
                            },
                            "Unknown": {
                              "color": "purple",
                              "index": 4
                            }
                          },
                          "type": "value"
                        }
                      ]
                    },
                    {
                      "id": "custom.displayMode",
                      "value": "color-text"
                    }
                  ]
                },
                {
                  "matcher": {
                    "id": "byName",
                    "options": "vuln_id"
                  },
                  "properties": [
                    {
                      "id": "links",
                      "value": [
                        {
                          "targetBlank": true,
                          "title": "https://nvd.nist.gov/vuln/detail/$${__value.text}",
                          "url": "https://nvd.nist.gov/vuln/detail/$${__value.text}"
                        }
                      ]
                    }
                  ]
                }
              ]
            },
            "gridPos": {
              "h": 12,
              "w": 24,
              "x": 0,
              "y": 26
            },
            "id": 78,
            "options": {
              "footer": {
                "enablePagination": true,
                "fields": "",
                "reducer": [
                  "sum"
                ],
                "show": false
              },
              "showHeader": true,
              "sortBy": []
            },
            "pluginVersion": "9.3.8",
            "targets": [
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "$${datasource}"
                },
                "editorMode": "code",
                "exemplar": false,
                "expr": "sum(trivy_vulnerability_id{vuln_id=~\"CVE.*\", namespace=~\"$namespace\"}) by (namespace, image_registry, image_repository, image_tag, vuln_id, severity)",
                "format": "table",
                "instant": false,
                "interval": "$resolution",
                "legendFormat": "__auto",
                "range": true,
                "refId": "A"
              }
            ],
            "title": "Detaillled CVE vulnerabilities in $namespace namespace(s)",
            "transformations": [
              {
                "id": "organize",
                "options": {
                  "excludeByName": {
                    "Time": true,
                    "Value": true,
                    "__name__": true,
                    "container": true,
                    "endpoint": true,
                    "instance": true,
                    "job": true,
                    "namespace": false,
                    "service": true
                  },
                  "indexByName": {
                    "Time": 0,
                    "Value": 7,
                    "image_registry": 2,
                    "image_repository": 3,
                    "image_tag": 4,
                    "namespace": 1,
                    "severity": 6,
                    "vuln_id": 5
                  },
                  "renameByName": {
                    "image_namespace": "namespace",
                    "image_registry": "Image Registry",
                    "image_repository": "Image Repository",
                    "image_tag": "Image Tag",
                    "namespace": "Namespace",
                    "severity": "Severity",
                    "vuln_id": "Vulnerability",
                    "vulnerability_id": ""
                  }
                }
              },
              {
                "id": "groupBy",
                "options": {
                  "fields": {
                    "Image Registry": {
                      "aggregations": [],
                      "operation": "groupby"
                    },
                    "Image Repository": {
                      "aggregations": [],
                      "operation": "groupby"
                    },
                    "Image Tag": {
                      "aggregations": [],
                      "operation": "groupby"
                    },
                    "Namespace": {
                      "aggregations": [],
                      "operation": "groupby"
                    },
                    "Severity": {
                      "aggregations": [],
                      "operation": "groupby"
                    },
                    "Value": {
                      "aggregations": [
                        "lastNotNull"
                      ]
                    },
                    "Vulnerability": {
                      "aggregations": [],
                      "operation": "groupby"
                    },
                    "image_namespace": {
                      "aggregations": [],
                      "operation": "groupby"
                    },
                    "namespace": {
                      "aggregations": [],
                      "operation": "groupby"
                    },
                    "severity": {
                      "aggregations": [],
                      "operation": "groupby"
                    },
                    "vuln_id": {
                      "aggregations": [],
                      "operation": "groupby"
                    },
                    "vulnerability_id": {
                      "aggregations": [],
                      "operation": "groupby"
                    }
                  }
                }
              }
            ],
            "type": "table"
          },
          {
            "collapsed": false,
            "datasource": {
              "type": "datasource",
              "uid": "grafana"
            },
            "gridPos": {
              "h": 1,
              "w": 24,
              "x": 0,
              "y": 38
            },
            "id": 47,
            "panels": [],
            "title": "Config Audit Reports",
            "type": "row"
          },
          {
            "datasource": {
              "type": "prometheus",
              "uid": "$${datasource}"
            },
            "fieldConfig": {
              "defaults": {
                "color": {
                  "mode": "thresholds"
                },
                "mappings": [],
                "thresholds": {
                  "mode": "absolute",
                  "steps": [
                    {
                      "color": "green",
                      "value": null
                    },
                    {
                      "color": "red",
                      "value": 1
                    }
                  ]
                },
                "unit": "none"
              },
              "overrides": []
            },
            "gridPos": {
              "h": 4,
              "w": 4,
              "x": 0,
              "y": 39
            },
            "id": 56,
            "options": {
              "colorMode": "value",
              "graphMode": "area",
              "justifyMode": "auto",
              "orientation": "auto",
              "reduceOptions": {
                "calcs": [
                  "last"
                ],
                "fields": "",
                "values": false
              },
              "textMode": "auto"
            },
            "pluginVersion": "9.3.8",
            "targets": [
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "$${datasource}"
                },
                "editorMode": "code",
                "exemplar": false,
                "expr": "sum(trivy_resource_configaudits{severity=\"Critical\", namespace=~\"$namespace\"})",
                "instant": true,
                "interval": "$resolution",
                "legendFormat": "__auto",
                "refId": "A"
              }
            ],
            "title": "CRITICAL",
            "type": "stat"
          },
          {
            "datasource": {
              "type": "prometheus",
              "uid": "$${datasource}"
            },
            "fieldConfig": {
              "defaults": {
                "color": {
                  "mode": "thresholds"
                },
                "mappings": [],
                "thresholds": {
                  "mode": "absolute",
                  "steps": [
                    {
                      "color": "green",
                      "value": null
                    },
                    {
                      "color": "orange",
                      "value": 1
                    }
                  ]
                },
                "unit": "none"
              },
              "overrides": []
            },
            "gridPos": {
              "h": 4,
              "w": 4,
              "x": 4,
              "y": 39
            },
            "id": 55,
            "options": {
              "colorMode": "value",
              "graphMode": "area",
              "justifyMode": "auto",
              "orientation": "auto",
              "reduceOptions": {
                "calcs": [
                  "last"
                ],
                "fields": "",
                "values": false
              },
              "textMode": "auto"
            },
            "pluginVersion": "9.3.8",
            "targets": [
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "$${datasource}"
                },
                "editorMode": "code",
                "exemplar": false,
                "expr": "sum(trivy_resource_configaudits{severity=\"High\", namespace=~\"$namespace\"})",
                "instant": true,
                "interval": "$resolution",
                "legendFormat": "__auto",
                "refId": "A"
              }
            ],
            "title": "HIGH",
            "type": "stat"
          },
          {
            "datasource": {
              "type": "prometheus",
              "uid": "$${datasource}"
            },
            "fieldConfig": {
              "defaults": {
                "color": {
                  "mode": "thresholds"
                },
                "mappings": [],
                "thresholds": {
                  "mode": "absolute",
                  "steps": [
                    {
                      "color": "green",
                      "value": null
                    },
                    {
                      "color": "yellow",
                      "value": 1
                    }
                  ]
                },
                "unit": "none"
              },
              "overrides": []
            },
            "gridPos": {
              "h": 4,
              "w": 4,
              "x": 8,
              "y": 39
            },
            "id": 54,
            "options": {
              "colorMode": "value",
              "graphMode": "area",
              "justifyMode": "auto",
              "orientation": "auto",
              "reduceOptions": {
                "calcs": [
                  "last"
                ],
                "fields": "",
                "values": false
              },
              "textMode": "auto"
            },
            "pluginVersion": "9.3.8",
            "targets": [
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "$${datasource}"
                },
                "editorMode": "code",
                "exemplar": false,
                "expr": "sum(trivy_resource_configaudits{severity=\"Medium\", namespace=~\"$namespace\"})",
                "instant": true,
                "interval": "$resolution",
                "legendFormat": "__auto",
                "refId": "A"
              }
            ],
            "title": "MEDIUM",
            "type": "stat"
          },
          {
            "datasource": {
              "type": "prometheus",
              "uid": "$${datasource}"
            },
            "fieldConfig": {
              "defaults": {
                "color": {
                  "mode": "thresholds"
                },
                "mappings": [],
                "thresholds": {
                  "mode": "absolute",
                  "steps": [
                    {
                      "color": "green",
                      "value": null
                    },
                    {
                      "color": "blue",
                      "value": 1
                    }
                  ]
                },
                "unit": "none"
              },
              "overrides": []
            },
            "gridPos": {
              "h": 4,
              "w": 4,
              "x": 12,
              "y": 39
            },
            "id": 53,
            "options": {
              "colorMode": "value",
              "graphMode": "area",
              "justifyMode": "auto",
              "orientation": "auto",
              "reduceOptions": {
                "calcs": [
                  "last"
                ],
                "fields": "",
                "values": false
              },
              "textMode": "auto"
            },
            "pluginVersion": "9.3.8",
            "targets": [
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "$${datasource}"
                },
                "editorMode": "code",
                "exemplar": false,
                "expr": "sum(trivy_resource_configaudits{severity=\"Low\", namespace=~\"$namespace\"})",
                "instant": true,
                "interval": "$resolution",
                "legendFormat": "__auto",
                "refId": "A"
              }
            ],
            "title": "LOW",
            "type": "stat"
          },
          {
            "datasource": {
              "type": "prometheus",
              "uid": "$${datasource}"
            },
            "fieldConfig": {
              "defaults": {
                "color": {
                  "mode": "thresholds"
                },
                "mappings": [],
                "thresholds": {
                  "mode": "absolute",
                  "steps": [
                    {
                      "color": "green",
                      "value": null
                    },
                    {
                      "color": "text",
                      "value": 1
                    }
                  ]
                },
                "unit": "none"
              },
              "overrides": []
            },
            "gridPos": {
              "h": 4,
              "w": 4,
              "x": 16,
              "y": 39
            },
            "id": 65,
            "options": {
              "colorMode": "value",
              "graphMode": "area",
              "justifyMode": "auto",
              "orientation": "auto",
              "reduceOptions": {
                "calcs": [
                  "last"
                ],
                "fields": "",
                "values": false
              },
              "textMode": "auto"
            },
            "pluginVersion": "9.3.8",
            "targets": [
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "$${datasource}"
                },
                "editorMode": "code",
                "exemplar": false,
                "expr": "sum(trivy_resource_configaudits{namespace=~\"$namespace\"})",
                "instant": true,
                "interval": "$resolution",
                "legendFormat": "__auto",
                "refId": "A"
              }
            ],
            "title": "TOTAL",
            "type": "stat"
          },
          {
            "datasource": {
              "type": "prometheus",
              "uid": "$${datasource}"
            },
            "fieldConfig": {
              "defaults": {
                "color": {
                  "mode": "palette-classic"
                },
                "custom": {
                  "axisCenteredZero": false,
                  "axisColorMode": "text",
                  "axisLabel": "",
                  "axisPlacement": "auto",
                  "barAlignment": 0,
                  "drawStyle": "line",
                  "fillOpacity": 15,
                  "gradientMode": "opacity",
                  "hideFrom": {
                    "legend": false,
                    "tooltip": false,
                    "viz": false
                  },
                  "lineInterpolation": "linear",
                  "lineWidth": 2,
                  "pointSize": 5,
                  "scaleDistribution": {
                    "type": "linear"
                  },
                  "showPoints": "never",
                  "spanNulls": false,
                  "stacking": {
                    "group": "A",
                    "mode": "none"
                  },
                  "thresholdsStyle": {
                    "mode": "off"
                  }
                },
                "mappings": [],
                "thresholds": {
                  "mode": "absolute",
                  "steps": [
                    {
                      "color": "green",
                      "value": null
                    },
                    {
                      "color": "blue",
                      "value": 1
                    }
                  ]
                },
                "unit": "none"
              },
              "overrides": []
            },
            "gridPos": {
              "h": 8,
              "w": 12,
              "x": 0,
              "y": 43
            },
            "id": 62,
            "options": {
              "legend": {
                "calcs": [],
                "displayMode": "table",
                "placement": "right",
                "showLegend": true
              },
              "tooltip": {
                "mode": "single",
                "sort": "none"
              }
            },
            "pluginVersion": "8.5.0",
            "targets": [
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "$${datasource}"
                },
                "editorMode": "code",
                "exemplar": false,
                "expr": "sum(trivy_resource_configaudits) by (namespace)",
                "instant": false,
                "interval": "$resolution",
                "legendFormat": "__auto",
                "range": true,
                "refId": "A"
              }
            ],
            "title": "Total config audit report by namespaces",
            "type": "timeseries"
          },
          {
            "datasource": {
              "type": "prometheus",
              "uid": "$${datasource}"
            },
            "fieldConfig": {
              "defaults": {
                "color": {
                  "mode": "palette-classic"
                },
                "custom": {
                  "axisCenteredZero": false,
                  "axisColorMode": "text",
                  "axisLabel": "",
                  "axisPlacement": "auto",
                  "barAlignment": 0,
                  "drawStyle": "line",
                  "fillOpacity": 15,
                  "gradientMode": "opacity",
                  "hideFrom": {
                    "legend": false,
                    "tooltip": false,
                    "viz": false
                  },
                  "lineInterpolation": "linear",
                  "lineWidth": 2,
                  "pointSize": 5,
                  "scaleDistribution": {
                    "type": "linear"
                  },
                  "showPoints": "never",
                  "spanNulls": false,
                  "stacking": {
                    "group": "A",
                    "mode": "none"
                  },
                  "thresholdsStyle": {
                    "mode": "off"
                  }
                },
                "mappings": [],
                "thresholds": {
                  "mode": "absolute",
                  "steps": [
                    {
                      "color": "green",
                      "value": null
                    },
                    {
                      "color": "blue",
                      "value": 1
                    }
                  ]
                },
                "unit": "none"
              },
              "overrides": [
                {
                  "matcher": {
                    "id": "byName",
                    "options": "Critical"
                  },
                  "properties": [
                    {
                      "id": "color",
                      "value": {
                        "fixedColor": "red",
                        "mode": "fixed"
                      }
                    }
                  ]
                },
                {
                  "matcher": {
                    "id": "byName",
                    "options": "High"
                  },
                  "properties": [
                    {
                      "id": "color",
                      "value": {
                        "fixedColor": "orange",
                        "mode": "fixed"
                      }
                    }
                  ]
                },
                {
                  "matcher": {
                    "id": "byName",
                    "options": "Medium"
                  },
                  "properties": [
                    {
                      "id": "color",
                      "value": {
                        "fixedColor": "yellow",
                        "mode": "fixed"
                      }
                    }
                  ]
                },
                {
                  "matcher": {
                    "id": "byName",
                    "options": "Low"
                  },
                  "properties": [
                    {
                      "id": "color",
                      "value": {
                        "fixedColor": "blue",
                        "mode": "fixed"
                      }
                    }
                  ]
                }
              ]
            },
            "gridPos": {
              "h": 8,
              "w": 12,
              "x": 12,
              "y": 43
            },
            "id": 63,
            "options": {
              "legend": {
                "calcs": [],
                "displayMode": "table",
                "placement": "right",
                "showLegend": true
              },
              "tooltip": {
                "mode": "multi",
                "sort": "desc"
              }
            },
            "pluginVersion": "8.5.0",
            "targets": [
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "$${datasource}"
                },
                "editorMode": "code",
                "exemplar": false,
                "expr": "sum(trivy_resource_configaudits) by (severity)",
                "instant": false,
                "interval": "$resolution",
                "legendFormat": "__auto",
                "range": true,
                "refId": "A"
              }
            ],
            "title": "Total config audit report by severity",
            "type": "timeseries"
          },
          {
            "collapsed": false,
            "gridPos": {
              "h": 1,
              "w": 24,
              "x": 0,
              "y": 51
            },
            "id": 68,
            "panels": [],
            "title": "RBAC Assessments",
            "type": "row"
          },
          {
            "datasource": {
              "type": "prometheus",
              "uid": "$${datasource}"
            },
            "fieldConfig": {
              "defaults": {
                "color": {
                  "mode": "thresholds"
                },
                "mappings": [],
                "thresholds": {
                  "mode": "absolute",
                  "steps": [
                    {
                      "color": "green",
                      "value": null
                    },
                    {
                      "color": "red",
                      "value": 1
                    }
                  ]
                },
                "unit": "none"
              },
              "overrides": []
            },
            "gridPos": {
              "h": 4,
              "w": 4,
              "x": 0,
              "y": 52
            },
            "id": 72,
            "options": {
              "colorMode": "value",
              "graphMode": "area",
              "justifyMode": "auto",
              "orientation": "auto",
              "reduceOptions": {
                "calcs": [
                  "last"
                ],
                "fields": "",
                "values": false
              },
              "textMode": "auto"
            },
            "pluginVersion": "9.3.8",
            "targets": [
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "$${datasource}"
                },
                "editorMode": "code",
                "exemplar": false,
                "expr": "sum(trivy_role_rbacassessments{severity=\"Critical\", namespace=~\"$namespace\"})",
                "instant": true,
                "interval": "$resolution",
                "legendFormat": "__auto",
                "refId": "A"
              }
            ],
            "title": "CRITICAL",
            "type": "stat"
          },
          {
            "datasource": {
              "type": "prometheus",
              "uid": "$${datasource}"
            },
            "fieldConfig": {
              "defaults": {
                "color": {
                  "mode": "thresholds"
                },
                "mappings": [],
                "thresholds": {
                  "mode": "absolute",
                  "steps": [
                    {
                      "color": "green",
                      "value": null
                    },
                    {
                      "color": "orange",
                      "value": 1
                    }
                  ]
                },
                "unit": "none"
              },
              "overrides": []
            },
            "gridPos": {
              "h": 4,
              "w": 4,
              "x": 4,
              "y": 52
            },
            "id": 71,
            "options": {
              "colorMode": "value",
              "graphMode": "area",
              "justifyMode": "auto",
              "orientation": "auto",
              "reduceOptions": {
                "calcs": [
                  "last"
                ],
                "fields": "",
                "values": false
              },
              "textMode": "auto"
            },
            "pluginVersion": "9.3.8",
            "targets": [
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "$${datasource}"
                },
                "editorMode": "code",
                "exemplar": false,
                "expr": "sum(trivy_role_rbacassessments{severity=\"High\", namespace=~\"$namespace\"})",
                "instant": true,
                "interval": "$resolution",
                "legendFormat": "__auto",
                "refId": "A"
              }
            ],
            "title": "HIGH",
            "type": "stat"
          },
          {
            "datasource": {
              "type": "prometheus",
              "uid": "$${datasource}"
            },
            "fieldConfig": {
              "defaults": {
                "color": {
                  "mode": "thresholds"
                },
                "mappings": [],
                "thresholds": {
                  "mode": "absolute",
                  "steps": [
                    {
                      "color": "green",
                      "value": null
                    },
                    {
                      "color": "yellow",
                      "value": 1
                    }
                  ]
                },
                "unit": "none"
              },
              "overrides": []
            },
            "gridPos": {
              "h": 4,
              "w": 4,
              "x": 8,
              "y": 52
            },
            "id": 70,
            "options": {
              "colorMode": "value",
              "graphMode": "area",
              "justifyMode": "auto",
              "orientation": "auto",
              "reduceOptions": {
                "calcs": [
                  "last"
                ],
                "fields": "",
                "values": false
              },
              "textMode": "auto"
            },
            "pluginVersion": "9.3.8",
            "targets": [
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "$${datasource}"
                },
                "editorMode": "code",
                "exemplar": false,
                "expr": "sum(trivy_role_rbacassessments{severity=\"Medium\", namespace=~\"$namespace\"})",
                "instant": true,
                "interval": "$resolution",
                "legendFormat": "__auto",
                "refId": "A"
              }
            ],
            "title": "MEDIUM",
            "type": "stat"
          },
          {
            "datasource": {
              "type": "prometheus",
              "uid": "$${datasource}"
            },
            "fieldConfig": {
              "defaults": {
                "color": {
                  "mode": "thresholds"
                },
                "mappings": [],
                "thresholds": {
                  "mode": "absolute",
                  "steps": [
                    {
                      "color": "green",
                      "value": null
                    },
                    {
                      "color": "blue",
                      "value": 1
                    }
                  ]
                },
                "unit": "none"
              },
              "overrides": []
            },
            "gridPos": {
              "h": 4,
              "w": 4,
              "x": 12,
              "y": 52
            },
            "id": 69,
            "options": {
              "colorMode": "value",
              "graphMode": "area",
              "justifyMode": "auto",
              "orientation": "auto",
              "reduceOptions": {
                "calcs": [
                  "last"
                ],
                "fields": "",
                "values": false
              },
              "textMode": "auto"
            },
            "pluginVersion": "9.3.8",
            "targets": [
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "$${datasource}"
                },
                "editorMode": "code",
                "exemplar": false,
                "expr": "sum(trivy_role_rbacassessments{severity=\"Low\", namespace=~\"$namespace\"})",
                "instant": true,
                "interval": "$resolution",
                "legendFormat": "__auto",
                "refId": "A"
              }
            ],
            "title": "LOW",
            "type": "stat"
          },
          {
            "datasource": {
              "type": "prometheus",
              "uid": "$${datasource}"
            },
            "fieldConfig": {
              "defaults": {
                "color": {
                  "mode": "thresholds"
                },
                "mappings": [],
                "thresholds": {
                  "mode": "absolute",
                  "steps": [
                    {
                      "color": "green",
                      "value": null
                    },
                    {
                      "color": "text",
                      "value": 1
                    }
                  ]
                },
                "unit": "none"
              },
              "overrides": []
            },
            "gridPos": {
              "h": 4,
              "w": 4,
              "x": 16,
              "y": 52
            },
            "id": 73,
            "options": {
              "colorMode": "value",
              "graphMode": "area",
              "justifyMode": "auto",
              "orientation": "auto",
              "reduceOptions": {
                "calcs": [
                  "last"
                ],
                "fields": "",
                "values": false
              },
              "textMode": "auto"
            },
            "pluginVersion": "9.3.8",
            "targets": [
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "$${datasource}"
                },
                "editorMode": "code",
                "exemplar": false,
                "expr": "sum(trivy_role_rbacassessments{namespace=~\"$namespace\"})",
                "instant": true,
                "interval": "$resolution",
                "legendFormat": "__auto",
                "refId": "A"
              }
            ],
            "title": "TOTAL",
            "type": "stat"
          },
          {
            "datasource": {
              "type": "prometheus",
              "uid": "$${datasource}"
            },
            "fieldConfig": {
              "defaults": {
                "color": {
                  "mode": "palette-classic"
                },
                "custom": {
                  "axisCenteredZero": false,
                  "axisColorMode": "text",
                  "axisLabel": "",
                  "axisPlacement": "auto",
                  "barAlignment": 0,
                  "drawStyle": "line",
                  "fillOpacity": 15,
                  "gradientMode": "opacity",
                  "hideFrom": {
                    "legend": false,
                    "tooltip": false,
                    "viz": false
                  },
                  "lineInterpolation": "linear",
                  "lineWidth": 2,
                  "pointSize": 5,
                  "scaleDistribution": {
                    "type": "linear"
                  },
                  "showPoints": "never",
                  "spanNulls": false,
                  "stacking": {
                    "group": "A",
                    "mode": "none"
                  },
                  "thresholdsStyle": {
                    "mode": "off"
                  }
                },
                "mappings": [],
                "thresholds": {
                  "mode": "absolute",
                  "steps": [
                    {
                      "color": "green",
                      "value": null
                    },
                    {
                      "color": "blue",
                      "value": 1
                    }
                  ]
                },
                "unit": "none"
              },
              "overrides": []
            },
            "gridPos": {
              "h": 8,
              "w": 12,
              "x": 0,
              "y": 56
            },
            "id": 74,
            "options": {
              "legend": {
                "calcs": [],
                "displayMode": "table",
                "placement": "right",
                "showLegend": true
              },
              "tooltip": {
                "mode": "single",
                "sort": "none"
              }
            },
            "pluginVersion": "8.5.0",
            "targets": [
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "$${datasource}"
                },
                "editorMode": "code",
                "exemplar": false,
                "expr": "sum(trivy_role_rbacassessments) by (namespace)",
                "instant": false,
                "interval": "$resolution",
                "legendFormat": "__auto",
                "range": true,
                "refId": "A"
              }
            ],
            "title": "Total RBAC Assessments by namespaces",
            "type": "timeseries"
          },
          {
            "datasource": {
              "type": "prometheus",
              "uid": "$${datasource}"
            },
            "fieldConfig": {
              "defaults": {
                "color": {
                  "mode": "palette-classic"
                },
                "custom": {
                  "axisCenteredZero": false,
                  "axisColorMode": "text",
                  "axisLabel": "",
                  "axisPlacement": "auto",
                  "barAlignment": 0,
                  "drawStyle": "line",
                  "fillOpacity": 15,
                  "gradientMode": "opacity",
                  "hideFrom": {
                    "legend": false,
                    "tooltip": false,
                    "viz": false
                  },
                  "lineInterpolation": "linear",
                  "lineWidth": 2,
                  "pointSize": 5,
                  "scaleDistribution": {
                    "type": "linear"
                  },
                  "showPoints": "never",
                  "spanNulls": false,
                  "stacking": {
                    "group": "A",
                    "mode": "none"
                  },
                  "thresholdsStyle": {
                    "mode": "off"
                  }
                },
                "mappings": [],
                "thresholds": {
                  "mode": "absolute",
                  "steps": [
                    {
                      "color": "green",
                      "value": null
                    },
                    {
                      "color": "blue",
                      "value": 1
                    }
                  ]
                },
                "unit": "none"
              },
              "overrides": [
                {
                  "matcher": {
                    "id": "byName",
                    "options": "Critical"
                  },
                  "properties": [
                    {
                      "id": "color",
                      "value": {
                        "fixedColor": "red",
                        "mode": "fixed"
                      }
                    }
                  ]
                },
                {
                  "matcher": {
                    "id": "byName",
                    "options": "High"
                  },
                  "properties": [
                    {
                      "id": "color",
                      "value": {
                        "fixedColor": "orange",
                        "mode": "fixed"
                      }
                    }
                  ]
                },
                {
                  "matcher": {
                    "id": "byName",
                    "options": "Medium"
                  },
                  "properties": [
                    {
                      "id": "color",
                      "value": {
                        "fixedColor": "yellow",
                        "mode": "fixed"
                      }
                    }
                  ]
                },
                {
                  "matcher": {
                    "id": "byName",
                    "options": "Low"
                  },
                  "properties": [
                    {
                      "id": "color",
                      "value": {
                        "fixedColor": "blue",
                        "mode": "fixed"
                      }
                    }
                  ]
                }
              ]
            },
            "gridPos": {
              "h": 8,
              "w": 12,
              "x": 12,
              "y": 56
            },
            "id": 75,
            "options": {
              "legend": {
                "calcs": [],
                "displayMode": "table",
                "placement": "right",
                "showLegend": true
              },
              "tooltip": {
                "mode": "multi",
                "sort": "desc"
              }
            },
            "pluginVersion": "8.5.0",
            "targets": [
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "$${datasource}"
                },
                "editorMode": "code",
                "exemplar": false,
                "expr": "sum(trivy_role_rbacassessments) by (severity)",
                "instant": false,
                "interval": "$resolution",
                "legendFormat": "__auto",
                "range": true,
                "refId": "A"
              }
            ],
            "title": "Total RBAC Assessments by severity",
            "type": "timeseries"
          },
          {
            "collapsed": false,
            "gridPos": {
              "h": 1,
              "w": 24,
              "x": 0,
              "y": 64
            },
            "id": 81,
            "panels": [],
            "title": "Exposed Secrets",
            "type": "row"
          },
          {
            "datasource": {
              "type": "prometheus",
              "uid": "$${datasource}"
            },
            "fieldConfig": {
              "defaults": {
                "color": {
                  "mode": "palette-classic"
                },
                "custom": {
                  "axisCenteredZero": false,
                  "axisColorMode": "text",
                  "axisLabel": "",
                  "axisPlacement": "auto",
                  "barAlignment": 0,
                  "drawStyle": "line",
                  "fillOpacity": 15,
                  "gradientMode": "opacity",
                  "hideFrom": {
                    "legend": false,
                    "tooltip": false,
                    "viz": false
                  },
                  "lineInterpolation": "linear",
                  "lineWidth": 2,
                  "pointSize": 5,
                  "scaleDistribution": {
                    "type": "linear"
                  },
                  "showPoints": "never",
                  "spanNulls": false,
                  "stacking": {
                    "group": "A",
                    "mode": "none"
                  },
                  "thresholdsStyle": {
                    "mode": "off"
                  }
                },
                "mappings": [],
                "thresholds": {
                  "mode": "absolute",
                  "steps": [
                    {
                      "color": "green",
                      "value": null
                    },
                    {
                      "color": "blue",
                      "value": 1
                    }
                  ]
                },
                "unit": "none"
              },
              "overrides": []
            },
            "gridPos": {
              "h": 8,
              "w": 24,
              "x": 0,
              "y": 65
            },
            "id": 76,
            "options": {
              "legend": {
                "calcs": [],
                "displayMode": "table",
                "placement": "right",
                "showLegend": true
              },
              "tooltip": {
                "mode": "single",
                "sort": "none"
              }
            },
            "pluginVersion": "8.5.0",
            "targets": [
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "$${datasource}"
                },
                "editorMode": "code",
                "exemplar": false,
                "expr": "sum(trivy_image_exposedsecrets) by (namespace)",
                "instant": false,
                "interval": "$resolution",
                "legendFormat": "__auto",
                "range": true,
                "refId": "A"
              }
            ],
            "title": "Total Exposed Secrets by namespaces",
            "type": "timeseries"
          }
        ],
        "refresh": "30s",
        "schemaVersion": 37,
        "style": "dark",
        "tags": [
          "Prometheus",
          "Addons",
          "Trivy",
          "Trivy-operator"
        ],
        "templating": {
          "list": [
            {
              "current": {
                "selected": false,
                "text": "Prometheus",
                "value": "Prometheus"
              },
              "hide": 0,
              "includeAll": false,
              "multi": false,
              "name": "datasource",
              "options": [],
              "query": "prometheus",
              "queryValue": "",
              "refresh": 1,
              "regex": "",
              "skipUrlSync": false,
              "type": "datasource"
            },
            {
              "current": {
                "selected": true,
                "text": [
                  "All"
                ],
                "value": [
                  "$__all"
                ]
              },
              "datasource": {
                "type": "prometheus",
                "uid": "$${datasource}"
              },
              "definition": "label_values(kube_pod_info, namespace)",
              "hide": 0,
              "includeAll": true,
              "multi": true,
              "name": "namespace",
              "options": [],
              "query": {
                "query": "label_values(kube_pod_info, namespace)",
                "refId": "StandardVariableQuery"
              },
              "refresh": 1,
              "regex": "",
              "skipUrlSync": false,
              "sort": 1,
              "type": "query"
            },
            {
              "current": {
                "selected": true,
                "text": "30s",
                "value": "30s"
              },
              "hide": 0,
              "includeAll": false,
              "multi": false,
              "name": "resolution",
              "options": [
                {
                  "selected": false,
                  "text": "1s",
                  "value": "1s"
                },
                {
                  "selected": false,
                  "text": "15s",
                  "value": "15s"
                },
                {
                  "selected": true,
                  "text": "30s",
                  "value": "30s"
                },
                {
                  "selected": false,
                  "text": "1m",
                  "value": "1m"
                },
                {
                  "selected": false,
                  "text": "3m",
                  "value": "3m"
                },
                {
                  "selected": false,
                  "text": "5m",
                  "value": "5m"
                }
              ],
              "query": "1s, 15s, 30s, 1m, 3m, 5m",
              "queryValue": "",
              "skipUrlSync": false,
              "type": "custom"
            }
          ]
        },
        "time": {
          "from": "now-1h",
          "to": "now"
        },
        "timepicker": {},
        "timezone": "",
        "title": "Trivy Operator - Vulnerabilities",
        "uid": "security_trivy_operator",
        "version": 8,
        "weekStart": ""
      }
      
      EOT
    }
    "kind" = "ConfigMap"
    "metadata" = {
      "annotations" = {
        "grafana_folder" = "Kubernetes"
      }
      "labels" = {
        "grafana_dashboard" = "1"
      }
      "name"      = "dashboards-k8s-addons-trivy-operator"
      "namespace" = "prometheus"
    }
  }
}

resource "kubernetes_manifest" "configmap_prometheus_dashboards_k8s_system_api_server" {
  manifest = {
    "apiVersion" = "v1"
    "data" = {
      "k8s-system-api-server.json" = <<-EOT
      {
        "__inputs": [
          {
            "name": "DS_PROMETHEUS",
            "label": "Prometheus",
            "description": "",
            "type": "datasource",
            "pluginId": "prometheus",
            "pluginName": "Prometheus"
          }
        ],
        "__elements": [],
        "__requires": [
          {
            "type": "grafana",
            "id": "grafana",
            "name": "Grafana",
            "version": "8.4.4"
          },
          {
            "type": "datasource",
            "id": "prometheus",
            "name": "Prometheus",
            "version": "5.0.0"
          },
          {
            "type": "panel",
            "id": "timeseries",
            "name": "Time series",
            "version": ""
          },
          {
            "type": "panel",
            "id": "stat",
            "name": "Stat",
            "version": ""
          }
        ],
        "annotations": {
          "list": [
            {
              "builtIn": 1,
              "datasource": {
                "type": "datasource",
                "uid": "grafana"
              },
              "enable": true,
              "hide": true,
              "iconColor": "rgba(0, 211, 255, 1)",
              "name": "Annotations & Alerts",
              "target": {
                "limit": 100,
                "matchAny": false,
                "tags": [],
                "type": "dashboard"
              },
              "type": "dashboard"
            }
          ]
        },
        "description": "This is a modern API Server dashboard for your Kubernetes cluster(s). Made for kube-prometheus-stack and take advantage of the latest Grafana features. GitHub repository: https://github.com/dotdc/grafana-dashboards-kubernetes",
        "editable": true,
        "fiscalYearStartMonth": 0,
        "graphTooltip": 1,
        "links": [],
        "liveNow": false,
        "panels": [
          {
            "datasource": {
              "type": "prometheus",
              "uid": "$${datasource}"
            },
            "fieldConfig": {
              "defaults": {
                "mappings": [
                  {
                    "options": {
                      "0": {
                        "text": "DOWN"
                      },
                      "1": {
                        "text": "UP"
                      }
                    },
                    "type": "value"
                  }
                ],
                "thresholds": {
                  "mode": "absolute",
                  "steps": [
                    {
                      "color": "red",
                      "value": null
                    },
                    {
                      "color": "green",
                      "value": 1
                    }
                  ]
                }
              },
              "overrides": []
            },
            "gridPos": {
              "h": 8,
              "w": 12,
              "x": 0,
              "y": 0
            },
            "id": 42,
            "options": {
              "colorMode": "background",
              "graphMode": "none",
              "justifyMode": "auto",
              "orientation": "horizontal",
              "reduceOptions": {
                "calcs": [
                  "lastNotNull"
                ],
                "fields": "",
                "values": false
              },
              "textMode": "value_and_name"
            },
            "pluginVersion": "10.0.1",
            "targets": [
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "$${datasource}"
                },
                "exemplar": true,
                "expr": "up{job=\"apiserver\"}",
                "interval": "",
                "legendFormat": "{{ instance }}",
                "refId": "A"
              }
            ],
            "title": "API Server - Health Status",
            "type": "stat"
          },
          {
            "datasource": {
              "type": "prometheus",
              "uid": "$${datasource}"
            },
            "fieldConfig": {
              "defaults": {
                "custom": {
                  "align": "auto",
                  "cellOptions": {
                    "type": "auto"
                  },
                  "inspect": false
                },
                "mappings": [],
                "thresholds": {
                  "mode": "absolute",
                  "steps": [
                    {
                      "color": "green",
                      "value": null
                    },
                    {
                      "color": "red",
                      "value": 80
                    }
                  ]
                }
              },
              "overrides": [
                {
                  "matcher": {
                    "id": "byName",
                    "options": "__name__"
                  },
                  "properties": [
                    {
                      "id": "custom.width",
                      "value": 188
                    }
                  ]
                }
              ]
            },
            "gridPos": {
              "h": 8,
              "w": 12,
              "x": 12,
              "y": 0
            },
            "id": 60,
            "options": {
              "cellHeight": "sm",
              "footer": {
                "countRows": false,
                "fields": "",
                "reducer": [
                  "sum"
                ],
                "show": false
              },
              "showHeader": true,
              "sortBy": [
                {
                  "desc": false,
                  "displayName": "removed_release"
                }
              ]
            },
            "pluginVersion": "10.0.1",
            "targets": [
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "$${datasource}"
                },
                "exemplar": true,
                "expr": "apiserver_requested_deprecated_apis",
                "interval": "",
                "legendFormat": "",
                "refId": "A"
              }
            ],
            "title": "Deprecated Kubernetes Resources",
            "transformations": [
              {
                "id": "labelsToFields",
                "options": {
                  "keepLabels": [
                    "group",
                    "job",
                    "removed_release",
                    "resource",
                    "version",
                    "name"
                  ],
                  "mode": "columns"
                }
              },
              {
                "id": "merge",
                "options": {}
              },
              {
                "id": "organize",
                "options": {
                  "excludeByName": {
                    "Time": true,
                    "Value": true,
                    "job": true
                  },
                  "indexByName": {
                    "Time": 6,
                    "Value": 7,
                    "group": 1,
                    "job": 5,
                    "namespace": 0,
                    "removed_release": 4,
                    "resource": 3,
                    "version": 2
                  },
                  "renameByName": {}
                }
              },
              {
                "id": "groupBy",
                "options": {
                  "fields": {
                    "group": {
                      "aggregations": [
                        "lastNotNull"
                      ],
                      "operation": "groupby"
                    },
                    "job": {
                      "aggregations": [],
                      "operation": "groupby"
                    },
                    "namespace": {
                      "aggregations": [
                        "lastNotNull"
                      ],
                      "operation": "groupby"
                    },
                    "removed_release": {
                      "aggregations": [],
                      "operation": "groupby"
                    },
                    "resource": {
                      "aggregations": [
                        "lastNotNull"
                      ],
                      "operation": "groupby"
                    },
                    "version": {
                      "aggregations": [],
                      "operation": "groupby"
                    }
                  }
                }
              }
            ],
            "type": "table"
          },
          {
            "datasource": {
              "type": "prometheus",
              "uid": "$${datasource}"
            },
            "fieldConfig": {
              "defaults": {
                "color": {
                  "mode": "palette-classic"
                },
                "custom": {
                  "axisCenteredZero": false,
                  "axisColorMode": "text",
                  "axisLabel": "",
                  "axisPlacement": "auto",
                  "barAlignment": 0,
                  "drawStyle": "line",
                  "fillOpacity": 25,
                  "gradientMode": "opacity",
                  "hideFrom": {
                    "legend": false,
                    "tooltip": false,
                    "viz": false
                  },
                  "lineInterpolation": "smooth",
                  "lineWidth": 2,
                  "pointSize": 5,
                  "scaleDistribution": {
                    "type": "linear"
                  },
                  "showPoints": "never",
                  "spanNulls": false,
                  "stacking": {
                    "group": "A",
                    "mode": "none"
                  },
                  "thresholdsStyle": {
                    "mode": "off"
                  }
                },
                "mappings": [],
                "thresholds": {
                  "mode": "absolute",
                  "steps": [
                    {
                      "color": "green",
                      "value": null
                    },
                    {
                      "color": "red",
                      "value": 80
                    }
                  ]
                },
                "unit": "short"
              },
              "overrides": []
            },
            "gridPos": {
              "h": 8,
              "w": 12,
              "x": 0,
              "y": 8
            },
            "id": 38,
            "options": {
              "legend": {
                "calcs": [],
                "displayMode": "list",
                "placement": "bottom",
                "showLegend": true
              },
              "tooltip": {
                "mode": "multi",
                "sort": "desc"
              }
            },
            "pluginVersion": "8.3.3",
            "targets": [
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "$${datasource}"
                },
                "exemplar": true,
                "expr": "sum by (code) (rate(apiserver_request_total[$__rate_interval]))",
                "interval": "$resolution",
                "legendFormat": "{{ code }}",
                "refId": "A"
              }
            ],
            "title": "API Server - HTTP Requests by code",
            "type": "timeseries"
          },
          {
            "datasource": {
              "type": "prometheus",
              "uid": "$${datasource}"
            },
            "fieldConfig": {
              "defaults": {
                "color": {
                  "mode": "palette-classic"
                },
                "custom": {
                  "axisCenteredZero": false,
                  "axisColorMode": "text",
                  "axisLabel": "",
                  "axisPlacement": "auto",
                  "barAlignment": 0,
                  "drawStyle": "line",
                  "fillOpacity": 25,
                  "gradientMode": "opacity",
                  "hideFrom": {
                    "legend": false,
                    "tooltip": false,
                    "viz": false
                  },
                  "lineInterpolation": "smooth",
                  "lineWidth": 2,
                  "pointSize": 5,
                  "scaleDistribution": {
                    "type": "linear"
                  },
                  "showPoints": "never",
                  "spanNulls": false,
                  "stacking": {
                    "group": "A",
                    "mode": "none"
                  },
                  "thresholdsStyle": {
                    "mode": "off"
                  }
                },
                "mappings": [],
                "thresholds": {
                  "mode": "absolute",
                  "steps": [
                    {
                      "color": "green",
                      "value": null
                    },
                    {
                      "color": "red",
                      "value": 80
                    }
                  ]
                },
                "unit": "short"
              },
              "overrides": []
            },
            "gridPos": {
              "h": 8,
              "w": 12,
              "x": 12,
              "y": 8
            },
            "id": 39,
            "options": {
              "legend": {
                "calcs": [],
                "displayMode": "list",
                "placement": "bottom",
                "showLegend": true
              },
              "tooltip": {
                "mode": "multi",
                "sort": "desc"
              }
            },
            "pluginVersion": "8.3.3",
            "targets": [
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "$${datasource}"
                },
                "exemplar": true,
                "expr": "sum by (verb) (rate(apiserver_request_total[$__rate_interval]))",
                "interval": "$resolution",
                "legendFormat": "{{ verb}}",
                "refId": "A"
              }
            ],
            "title": "API Server - HTTP Requests by verb",
            "type": "timeseries"
          },
          {
            "datasource": {
              "type": "prometheus",
              "uid": "$${datasource}"
            },
            "fieldConfig": {
              "defaults": {
                "color": {
                  "mode": "palette-classic"
                },
                "custom": {
                  "axisCenteredZero": false,
                  "axisColorMode": "text",
                  "axisLabel": "",
                  "axisPlacement": "auto",
                  "barAlignment": 0,
                  "drawStyle": "line",
                  "fillOpacity": 25,
                  "gradientMode": "opacity",
                  "hideFrom": {
                    "legend": false,
                    "tooltip": false,
                    "viz": false
                  },
                  "lineInterpolation": "smooth",
                  "lineWidth": 2,
                  "pointSize": 5,
                  "scaleDistribution": {
                    "type": "linear"
                  },
                  "showPoints": "never",
                  "spanNulls": false,
                  "stacking": {
                    "group": "A",
                    "mode": "none"
                  },
                  "thresholdsStyle": {
                    "mode": "off"
                  }
                },
                "mappings": [],
                "thresholds": {
                  "mode": "absolute",
                  "steps": [
                    {
                      "color": "green",
                      "value": null
                    },
                    {
                      "color": "red",
                      "value": 80
                    }
                  ]
                },
                "unit": "ms"
              },
              "overrides": []
            },
            "gridPos": {
              "h": 8,
              "w": 12,
              "x": 0,
              "y": 16
            },
            "id": 53,
            "options": {
              "legend": {
                "calcs": [],
                "displayMode": "list",
                "placement": "bottom",
                "showLegend": true
              },
              "tooltip": {
                "mode": "single",
                "sort": "none"
              }
            },
            "pluginVersion": "8.3.3",
            "targets": [
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "$${datasource}"
                },
                "exemplar": true,
                "expr": "sum(rate(apiserver_request_duration_seconds_sum{job=\"apiserver\"}[$__rate_interval])) by (instance)\n/\nsum(rate(apiserver_request_duration_seconds_count{job=\"apiserver\"}[$__rate_interval])) by (instance)",
                "interval": "$resolution",
                "legendFormat": "{{ instance }}",
                "refId": "A"
              }
            ],
            "title": "API Server - HTTP Requests Latency by instance",
            "type": "timeseries"
          },
          {
            "datasource": {
              "type": "prometheus",
              "uid": "$${datasource}"
            },
            "fieldConfig": {
              "defaults": {
                "color": {
                  "mode": "palette-classic"
                },
                "custom": {
                  "axisCenteredZero": false,
                  "axisColorMode": "text",
                  "axisLabel": "",
                  "axisPlacement": "auto",
                  "barAlignment": 0,
                  "drawStyle": "line",
                  "fillOpacity": 25,
                  "gradientMode": "opacity",
                  "hideFrom": {
                    "legend": false,
                    "tooltip": false,
                    "viz": false
                  },
                  "lineInterpolation": "smooth",
                  "lineWidth": 2,
                  "pointSize": 5,
                  "scaleDistribution": {
                    "type": "linear"
                  },
                  "showPoints": "never",
                  "spanNulls": false,
                  "stacking": {
                    "group": "A",
                    "mode": "none"
                  },
                  "thresholdsStyle": {
                    "mode": "off"
                  }
                },
                "mappings": [],
                "thresholds": {
                  "mode": "absolute",
                  "steps": [
                    {
                      "color": "green",
                      "value": null
                    },
                    {
                      "color": "red",
                      "value": 80
                    }
                  ]
                },
                "unit": "ms"
              },
              "overrides": []
            },
            "gridPos": {
              "h": 8,
              "w": 12,
              "x": 12,
              "y": 16
            },
            "id": 54,
            "options": {
              "legend": {
                "calcs": [],
                "displayMode": "list",
                "placement": "bottom",
                "showLegend": true
              },
              "tooltip": {
                "mode": "multi",
                "sort": "desc"
              }
            },
            "pluginVersion": "8.3.3",
            "targets": [
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "$${datasource}"
                },
                "exemplar": true,
                "expr": "sum(rate(apiserver_request_duration_seconds_sum{job=\"apiserver\"}[$__rate_interval])) by (verb)\n/\nsum(rate(apiserver_request_duration_seconds_count{job=\"apiserver\"}[$__rate_interval])) by (verb)",
                "interval": "$resolution",
                "legendFormat": "{{ verb }}",
                "refId": "A"
              }
            ],
            "title": "API Server - HTTP Requests Latency by verb",
            "type": "timeseries"
          },
          {
            "datasource": {
              "type": "prometheus",
              "uid": "$${datasource}"
            },
            "fieldConfig": {
              "defaults": {
                "color": {
                  "mode": "palette-classic"
                },
                "custom": {
                  "axisCenteredZero": false,
                  "axisColorMode": "text",
                  "axisLabel": "",
                  "axisPlacement": "auto",
                  "barAlignment": 0,
                  "drawStyle": "line",
                  "fillOpacity": 25,
                  "gradientMode": "opacity",
                  "hideFrom": {
                    "legend": false,
                    "tooltip": false,
                    "viz": false
                  },
                  "lineInterpolation": "smooth",
                  "lineWidth": 2,
                  "pointSize": 5,
                  "scaleDistribution": {
                    "type": "linear"
                  },
                  "showPoints": "never",
                  "spanNulls": false,
                  "stacking": {
                    "group": "A",
                    "mode": "none"
                  },
                  "thresholdsStyle": {
                    "mode": "off"
                  }
                },
                "mappings": [],
                "thresholds": {
                  "mode": "absolute",
                  "steps": [
                    {
                      "color": "green",
                      "value": null
                    },
                    {
                      "color": "red",
                      "value": 80
                    }
                  ]
                },
                "unit": "short"
              },
              "overrides": []
            },
            "gridPos": {
              "h": 8,
              "w": 12,
              "x": 0,
              "y": 24
            },
            "id": 50,
            "options": {
              "legend": {
                "calcs": [],
                "displayMode": "list",
                "placement": "bottom",
                "showLegend": true
              },
              "tooltip": {
                "mode": "single",
                "sort": "none"
              }
            },
            "pluginVersion": "8.3.3",
            "targets": [
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "$${datasource}"
                },
                "exemplar": true,
                "expr": "sum by(instance) (rate(apiserver_request_total{code=~\"5..\", job=\"apiserver\"}[$__rate_interval]))\n / sum by(instance) (rate(apiserver_request_total{job=\"apiserver\"}[$__rate_interval]))",
                "interval": "$resolution",
                "legendFormat": "{{ instance }}",
                "refId": "A"
              }
            ],
            "title": "API Server - Errors by Instance",
            "type": "timeseries"
          },
          {
            "datasource": {
              "type": "prometheus",
              "uid": "$${datasource}"
            },
            "fieldConfig": {
              "defaults": {
                "color": {
                  "mode": "palette-classic"
                },
                "custom": {
                  "axisCenteredZero": false,
                  "axisColorMode": "text",
                  "axisLabel": "",
                  "axisPlacement": "auto",
                  "barAlignment": 0,
                  "drawStyle": "line",
                  "fillOpacity": 25,
                  "gradientMode": "opacity",
                  "hideFrom": {
                    "legend": false,
                    "tooltip": false,
                    "viz": false
                  },
                  "lineInterpolation": "smooth",
                  "lineWidth": 2,
                  "pointSize": 5,
                  "scaleDistribution": {
                    "type": "linear"
                  },
                  "showPoints": "never",
                  "spanNulls": false,
                  "stacking": {
                    "group": "A",
                    "mode": "none"
                  },
                  "thresholdsStyle": {
                    "mode": "off"
                  }
                },
                "mappings": [],
                "thresholds": {
                  "mode": "absolute",
                  "steps": [
                    {
                      "color": "green",
                      "value": null
                    },
                    {
                      "color": "red",
                      "value": 80
                    }
                  ]
                },
                "unit": "short"
              },
              "overrides": []
            },
            "gridPos": {
              "h": 8,
              "w": 12,
              "x": 12,
              "y": 24
            },
            "id": 51,
            "options": {
              "legend": {
                "calcs": [],
                "displayMode": "list",
                "placement": "bottom",
                "showLegend": true
              },
              "tooltip": {
                "mode": "multi",
                "sort": "none"
              }
            },
            "pluginVersion": "8.3.3",
            "targets": [
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "$${datasource}"
                },
                "exemplar": true,
                "expr": "sum by(verb) (rate(apiserver_request_total{code=~\"5..\",job=\"apiserver\"}[$__rate_interval]))\n / sum by(verb) (rate(apiserver_request_total{job=\"apiserver\"}[$__rate_interval]))",
                "interval": "$resolution",
                "legendFormat": "{{ verb }}",
                "refId": "A"
              }
            ],
            "title": "API Server - Errors by verb",
            "type": "timeseries"
          },
          {
            "datasource": {
              "type": "prometheus",
              "uid": "$${datasource}"
            },
            "fieldConfig": {
              "defaults": {
                "color": {
                  "mode": "palette-classic"
                },
                "custom": {
                  "axisCenteredZero": false,
                  "axisColorMode": "text",
                  "axisLabel": "",
                  "axisPlacement": "auto",
                  "barAlignment": 0,
                  "drawStyle": "line",
                  "fillOpacity": 25,
                  "gradientMode": "opacity",
                  "hideFrom": {
                    "legend": false,
                    "tooltip": false,
                    "viz": false
                  },
                  "lineInterpolation": "smooth",
                  "lineWidth": 2,
                  "pointSize": 5,
                  "scaleDistribution": {
                    "type": "linear"
                  },
                  "showPoints": "never",
                  "spanNulls": false,
                  "stacking": {
                    "group": "A",
                    "mode": "normal"
                  },
                  "thresholdsStyle": {
                    "mode": "off"
                  }
                },
                "mappings": [],
                "thresholds": {
                  "mode": "absolute",
                  "steps": [
                    {
                      "color": "green",
                      "value": null
                    },
                    {
                      "color": "red",
                      "value": 80
                    }
                  ]
                },
                "unit": "short"
              },
              "overrides": []
            },
            "gridPos": {
              "h": 8,
              "w": 12,
              "x": 0,
              "y": 32
            },
            "id": 40,
            "options": {
              "legend": {
                "calcs": [],
                "displayMode": "list",
                "placement": "bottom",
                "showLegend": true
              },
              "tooltip": {
                "mode": "single",
                "sort": "none"
              }
            },
            "pluginVersion": "8.3.3",
            "targets": [
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "$${datasource}"
                },
                "exemplar": true,
                "expr": "sum(rate(apiserver_request_total[$__rate_interval])) by (instance)",
                "interval": "$resolution",
                "legendFormat": "{{ instance }}",
                "refId": "A"
              }
            ],
            "title": "API Server - Stacked HTTP Requests by instance",
            "type": "timeseries"
          },
          {
            "datasource": {
              "type": "prometheus",
              "uid": "$${datasource}"
            },
            "fieldConfig": {
              "defaults": {
                "color": {
                  "mode": "palette-classic"
                },
                "custom": {
                  "axisCenteredZero": false,
                  "axisColorMode": "text",
                  "axisLabel": "",
                  "axisPlacement": "auto",
                  "barAlignment": 0,
                  "drawStyle": "line",
                  "fillOpacity": 25,
                  "gradientMode": "opacity",
                  "hideFrom": {
                    "legend": false,
                    "tooltip": false,
                    "viz": false
                  },
                  "lineInterpolation": "smooth",
                  "lineWidth": 2,
                  "pointSize": 5,
                  "scaleDistribution": {
                    "type": "linear"
                  },
                  "showPoints": "never",
                  "spanNulls": false,
                  "stacking": {
                    "group": "A",
                    "mode": "none"
                  },
                  "thresholdsStyle": {
                    "mode": "off"
                  }
                },
                "mappings": [],
                "thresholds": {
                  "mode": "absolute",
                  "steps": [
                    {
                      "color": "green",
                      "value": null
                    },
                    {
                      "color": "red",
                      "value": 80
                    }
                  ]
                },
                "unit": "short"
              },
              "overrides": []
            },
            "gridPos": {
              "h": 8,
              "w": 12,
              "x": 12,
              "y": 32
            },
            "id": 56,
            "options": {
              "legend": {
                "calcs": [],
                "displayMode": "list",
                "placement": "bottom",
                "showLegend": true
              },
              "tooltip": {
                "mode": "single",
                "sort": "none"
              }
            },
            "pluginVersion": "8.3.3",
            "targets": [
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "$${datasource}"
                },
                "exemplar": true,
                "expr": "sum(rate(workqueue_depth{job=\"apiserver\"}[$__rate_interval])) by (instance)",
                "interval": "$resolution",
                "legendFormat": "{{ instance }}",
                "refId": "A"
              }
            ],
            "title": "API Server - Work Queue by instance",
            "type": "timeseries"
          },
          {
            "datasource": {
              "type": "prometheus",
              "uid": "$${datasource}"
            },
            "fieldConfig": {
              "defaults": {
                "color": {
                  "mode": "palette-classic"
                },
                "custom": {
                  "axisCenteredZero": false,
                  "axisColorMode": "text",
                  "axisLabel": "",
                  "axisPlacement": "auto",
                  "barAlignment": 0,
                  "drawStyle": "line",
                  "fillOpacity": 25,
                  "gradientMode": "opacity",
                  "hideFrom": {
                    "legend": false,
                    "tooltip": false,
                    "viz": false
                  },
                  "lineInterpolation": "smooth",
                  "lineWidth": 2,
                  "pointSize": 5,
                  "scaleDistribution": {
                    "type": "linear"
                  },
                  "showPoints": "never",
                  "spanNulls": false,
                  "stacking": {
                    "group": "A",
                    "mode": "none"
                  },
                  "thresholdsStyle": {
                    "mode": "off"
                  }
                },
                "decimals": 2,
                "mappings": [],
                "thresholds": {
                  "mode": "absolute",
                  "steps": [
                    {
                      "color": "green",
                      "value": null
                    },
                    {
                      "color": "red",
                      "value": 80
                    }
                  ]
                },
                "unit": "percentunit"
              },
              "overrides": []
            },
            "gridPos": {
              "h": 8,
              "w": 12,
              "x": 0,
              "y": 40
            },
            "id": 47,
            "options": {
              "legend": {
                "calcs": [],
                "displayMode": "list",
                "placement": "bottom",
                "showLegend": true
              },
              "tooltip": {
                "mode": "single",
                "sort": "none"
              }
            },
            "pluginVersion": "8.3.3",
            "targets": [
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "$${datasource}"
                },
                "exemplar": true,
                "expr": "rate(process_cpu_seconds_total{job=\"apiserver\"}[$__rate_interval])",
                "interval": "$resolution",
                "legendFormat": "{{ instance }}",
                "refId": "A"
              }
            ],
            "title": "API Server - CPU Usage by instance",
            "type": "timeseries"
          },
          {
            "datasource": {
              "type": "prometheus",
              "uid": "$${datasource}"
            },
            "fieldConfig": {
              "defaults": {
                "color": {
                  "mode": "palette-classic"
                },
                "custom": {
                  "axisCenteredZero": false,
                  "axisColorMode": "text",
                  "axisLabel": "",
                  "axisPlacement": "auto",
                  "barAlignment": 0,
                  "drawStyle": "line",
                  "fillOpacity": 25,
                  "gradientMode": "opacity",
                  "hideFrom": {
                    "legend": false,
                    "tooltip": false,
                    "viz": false
                  },
                  "lineInterpolation": "smooth",
                  "lineWidth": 2,
                  "pointSize": 5,
                  "scaleDistribution": {
                    "type": "linear"
                  },
                  "showPoints": "never",
                  "spanNulls": false,
                  "stacking": {
                    "group": "A",
                    "mode": "none"
                  },
                  "thresholdsStyle": {
                    "mode": "off"
                  }
                },
                "mappings": [],
                "thresholds": {
                  "mode": "absolute",
                  "steps": [
                    {
                      "color": "green",
                      "value": null
                    },
                    {
                      "color": "red",
                      "value": 80
                    }
                  ]
                },
                "unit": "bytes"
              },
              "overrides": []
            },
            "gridPos": {
              "h": 8,
              "w": 12,
              "x": 12,
              "y": 40
            },
            "id": 48,
            "options": {
              "legend": {
                "calcs": [],
                "displayMode": "list",
                "placement": "bottom",
                "showLegend": true
              },
              "tooltip": {
                "mode": "single",
                "sort": "none"
              }
            },
            "pluginVersion": "8.3.3",
            "targets": [
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "$${datasource}"
                },
                "exemplar": true,
                "expr": "process_resident_memory_bytes{job=\"apiserver\"}",
                "interval": "$resolution",
                "legendFormat": "{{ instance }}",
                "refId": "A"
              }
            ],
            "title": "API Server - Memory Usage by instance",
            "type": "timeseries"
          }
        ],
        "refresh": "30s",
        "schemaVersion": 38,
        "style": "dark",
        "tags": [
          "Kubernetes",
          "Prometheus"
        ],
        "templating": {
          "list": [
            {
              "current": {
                "selected": false,
                "text": "Prometheus",
                "value": "Prometheus"
              },
              "hide": 0,
              "includeAll": false,
              "label": "",
              "multi": false,
              "name": "datasource",
              "options": [],
              "query": "prometheus",
              "queryValue": "",
              "refresh": 1,
              "regex": "",
              "skipUrlSync": false,
              "type": "datasource"
            },
            {
              "current": {
                "selected": true,
                "text": "30s",
                "value": "30s"
              },
              "hide": 0,
              "includeAll": false,
              "multi": false,
              "name": "resolution",
              "options": [
                {
                  "selected": false,
                  "text": "1s",
                  "value": "1s"
                },
                {
                  "selected": false,
                  "text": "15s",
                  "value": "15s"
                },
                {
                  "selected": true,
                  "text": "30s",
                  "value": "30s"
                },
                {
                  "selected": false,
                  "text": "1m",
                  "value": "1m"
                },
                {
                  "selected": false,
                  "text": "3m",
                  "value": "3m"
                },
                {
                  "selected": false,
                  "text": "5m",
                  "value": "5m"
                }
              ],
              "query": "1s, 15s, 30s, 1m, 3m, 5m",
              "queryValue": "",
              "skipUrlSync": false,
              "type": "custom"
            }
          ]
        },
        "time": {
          "from": "now-1h",
          "to": "now"
        },
        "timepicker": {},
        "timezone": "",
        "title": "Kubernetes / System / API Server",
        "uid": "k8s_system_apisrv",
        "version": 14,
        "weekStart": ""
      }
      
      EOT
    }
    "kind" = "ConfigMap"
    "metadata" = {
      "annotations" = {
        "grafana_folder" = "Kubernetes"
      }
      "labels" = {
        "grafana_dashboard" = "1"
      }
      "name"      = "dashboards-k8s-system-api-server"
      "namespace" = "prometheus"
    }
  }
}

resource "kubernetes_manifest" "configmap_prometheus_dashboards_k8s_system_coredns" {
  manifest = {
    "apiVersion" = "v1"
    "data" = {
      "k8s-system-coredns.json" = <<-EOT
      {
        "__inputs": [
          {
            "name": "DS_PROMETHEUS",
            "label": "Prometheus",
            "description": "",
            "type": "datasource",
            "pluginId": "prometheus",
            "pluginName": "Prometheus"
          }
        ],
        "__elements": [],
        "__requires": [
          {
            "type": "grafana",
            "id": "grafana",
            "name": "Grafana",
            "version": "8.4.4"
          },
          {
            "type": "datasource",
            "id": "prometheus",
            "name": "Prometheus",
            "version": "5.0.0"
          },
          {
            "type": "panel",
            "id": "timeseries",
            "name": "Time series",
            "version": ""
          },
          {
            "type": "panel",
            "id": "stat",
            "name": "Stat",
            "version": ""
          }
        ],
        "annotations": {
          "list": [
            {
              "builtIn": 1,
              "datasource": {
                "type": "datasource",
                "uid": "grafana"
              },
              "enable": true,
              "hide": true,
              "iconColor": "rgba(0, 211, 255, 1)",
              "name": "Annotations & Alerts",
              "target": {
                "limit": 100,
                "matchAny": false,
                "tags": [],
                "type": "dashboard"
              },
              "type": "dashboard"
            }
          ]
        },
        "description": "This is a modern CoreDNS dashboard for your Kubernetes cluster(s). Made for kube-prometheus-stack and take advantage of the latest Grafana features. GitHub repository: https://github.com/dotdc/grafana-dashboards-kubernetes",
        "editable": true,
        "fiscalYearStartMonth": 0,
        "graphTooltip": 1,
        "links": [],
        "liveNow": false,
        "panels": [
          {
            "datasource": {
              "type": "prometheus",
              "uid": "$${datasource}"
            },
            "fieldConfig": {
              "defaults": {
                "mappings": [
                  {
                    "options": {
                      "0": {
                        "text": "DOWN"
                      },
                      "1": {
                        "text": "UP"
                      }
                    },
                    "type": "value"
                  }
                ],
                "thresholds": {
                  "mode": "absolute",
                  "steps": [
                    {
                      "color": "red",
                      "value": null
                    },
                    {
                      "color": "green",
                      "value": 1
                    }
                  ]
                }
              },
              "overrides": []
            },
            "gridPos": {
              "h": 3,
              "w": 24,
              "x": 0,
              "y": 0
            },
            "id": 25,
            "options": {
              "colorMode": "background",
              "graphMode": "none",
              "justifyMode": "auto",
              "orientation": "vertical",
              "reduceOptions": {
                "calcs": [
                  "lastNotNull"
                ],
                "fields": "",
                "values": false
              },
              "textMode": "value_and_name"
            },
            "pluginVersion": "10.0.1",
            "targets": [
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "$${datasource}"
                },
                "exemplar": true,
                "expr": "up{job=\"coredns\", instance=~\"$instance\"}",
                "interval": "",
                "legendFormat": "{{ instance }}",
                "refId": "A"
              }
            ],
            "title": "CoreDNS - Health Status",
            "type": "stat"
          },
          {
            "datasource": {
              "type": "prometheus",
              "uid": "$${datasource}"
            },
            "fieldConfig": {
              "defaults": {
                "color": {
                  "mode": "palette-classic"
                },
                "custom": {
                  "axisCenteredZero": false,
                  "axisColorMode": "text",
                  "axisLabel": "",
                  "axisPlacement": "auto",
                  "barAlignment": 0,
                  "drawStyle": "line",
                  "fillOpacity": 25,
                  "gradientMode": "opacity",
                  "hideFrom": {
                    "legend": false,
                    "tooltip": false,
                    "viz": false
                  },
                  "lineInterpolation": "smooth",
                  "lineWidth": 2,
                  "pointSize": 5,
                  "scaleDistribution": {
                    "type": "linear"
                  },
                  "showPoints": "never",
                  "spanNulls": false,
                  "stacking": {
                    "group": "A",
                    "mode": "none"
                  },
                  "thresholdsStyle": {
                    "mode": "off"
                  }
                },
                "decimals": 2,
                "mappings": [],
                "thresholds": {
                  "mode": "absolute",
                  "steps": [
                    {
                      "color": "green",
                      "value": null
                    },
                    {
                      "color": "red",
                      "value": 80
                    }
                  ]
                },
                "unit": "percentunit"
              },
              "overrides": []
            },
            "gridPos": {
              "h": 8,
              "w": 12,
              "x": 0,
              "y": 3
            },
            "id": 19,
            "options": {
              "legend": {
                "calcs": [],
                "displayMode": "list",
                "placement": "bottom",
                "showLegend": true
              },
              "tooltip": {
                "mode": "single",
                "sort": "none"
              }
            },
            "pluginVersion": "8.3.3",
            "targets": [
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "$${datasource}"
                },
                "exemplar": true,
                "expr": "rate(process_cpu_seconds_total{job=\"coredns\", instance=~\"$instance\"}[$__rate_interval])",
                "interval": "$resolution",
                "legendFormat": "{{ instance }}",
                "refId": "A"
              }
            ],
            "title": "CoreDNS - CPU Usage by instance",
            "type": "timeseries"
          },
          {
            "datasource": {
              "type": "prometheus",
              "uid": "$${datasource}"
            },
            "fieldConfig": {
              "defaults": {
                "color": {
                  "mode": "palette-classic"
                },
                "custom": {
                  "axisCenteredZero": false,
                  "axisColorMode": "text",
                  "axisLabel": "",
                  "axisPlacement": "auto",
                  "barAlignment": 0,
                  "drawStyle": "line",
                  "fillOpacity": 25,
                  "gradientMode": "opacity",
                  "hideFrom": {
                    "legend": false,
                    "tooltip": false,
                    "viz": false
                  },
                  "lineInterpolation": "smooth",
                  "lineWidth": 2,
                  "pointSize": 5,
                  "scaleDistribution": {
                    "type": "linear"
                  },
                  "showPoints": "never",
                  "spanNulls": false,
                  "stacking": {
                    "group": "A",
                    "mode": "none"
                  },
                  "thresholdsStyle": {
                    "mode": "off"
                  }
                },
                "mappings": [],
                "thresholds": {
                  "mode": "absolute",
                  "steps": [
                    {
                      "color": "green",
                      "value": null
                    },
                    {
                      "color": "red",
                      "value": 80
                    }
                  ]
                },
                "unit": "bytes"
              },
              "overrides": []
            },
            "gridPos": {
              "h": 8,
              "w": 12,
              "x": 12,
              "y": 3
            },
            "id": 21,
            "options": {
              "legend": {
                "calcs": [],
                "displayMode": "list",
                "placement": "bottom",
                "showLegend": true
              },
              "tooltip": {
                "mode": "single",
                "sort": "none"
              }
            },
            "pluginVersion": "8.3.3",
            "targets": [
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "$${datasource}"
                },
                "exemplar": true,
                "expr": "process_resident_memory_bytes{job=\"coredns\", instance=~\"$instance\"}",
                "interval": "",
                "legendFormat": "{{ instance }}",
                "refId": "A"
              }
            ],
            "title": "CoreDNS - Memory Usage by instance",
            "type": "timeseries"
          },
          {
            "datasource": {
              "type": "prometheus",
              "uid": "$${datasource}"
            },
            "fieldConfig": {
              "defaults": {
                "color": {
                  "mode": "palette-classic"
                },
                "custom": {
                  "axisCenteredZero": false,
                  "axisColorMode": "text",
                  "axisLabel": "",
                  "axisPlacement": "auto",
                  "barAlignment": 0,
                  "drawStyle": "line",
                  "fillOpacity": 25,
                  "gradientMode": "opacity",
                  "hideFrom": {
                    "legend": false,
                    "tooltip": false,
                    "viz": false
                  },
                  "lineInterpolation": "smooth",
                  "lineWidth": 2,
                  "pointSize": 5,
                  "scaleDistribution": {
                    "type": "linear"
                  },
                  "showPoints": "never",
                  "spanNulls": false,
                  "stacking": {
                    "group": "A",
                    "mode": "none"
                  },
                  "thresholdsStyle": {
                    "mode": "off"
                  }
                },
                "mappings": [],
                "thresholds": {
                  "mode": "absolute",
                  "steps": [
                    {
                      "color": "green",
                      "value": null
                    },
                    {
                      "color": "red",
                      "value": 80
                    }
                  ]
                },
                "unit": "short"
              },
              "overrides": []
            },
            "gridPos": {
              "h": 8,
              "w": 12,
              "x": 0,
              "y": 11
            },
            "id": 9,
            "options": {
              "legend": {
                "calcs": [],
                "displayMode": "list",
                "placement": "bottom",
                "showLegend": false
              },
              "tooltip": {
                "mode": "multi",
                "sort": "none"
              }
            },
            "pluginVersion": "8.3.3",
            "targets": [
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "$${datasource}"
                },
                "exemplar": true,
                "expr": "sum(rate(coredns_dns_requests_total{instance=~\"$instance\",proto=\"$protocol\"}[$__rate_interval]))",
                "interval": "$resolution",
                "legendFormat": "total $protocol requests",
                "refId": "A"
              }
            ],
            "title": "CoreDNS - Total DNS Requests ($protocol)",
            "type": "timeseries"
          },
          {
            "datasource": {
              "type": "prometheus",
              "uid": "$${datasource}"
            },
            "fieldConfig": {
              "defaults": {
                "color": {
                  "mode": "palette-classic"
                },
                "custom": {
                  "axisCenteredZero": false,
                  "axisColorMode": "text",
                  "axisLabel": "",
                  "axisPlacement": "auto",
                  "barAlignment": 0,
                  "drawStyle": "line",
                  "fillOpacity": 25,
                  "gradientMode": "opacity",
                  "hideFrom": {
                    "legend": false,
                    "tooltip": false,
                    "viz": false
                  },
                  "lineInterpolation": "smooth",
                  "lineWidth": 2,
                  "pointSize": 5,
                  "scaleDistribution": {
                    "type": "linear"
                  },
                  "showPoints": "never",
                  "spanNulls": false,
                  "stacking": {
                    "group": "A",
                    "mode": "none"
                  },
                  "thresholdsStyle": {
                    "mode": "off"
                  }
                },
                "mappings": [],
                "thresholds": {
                  "mode": "absolute",
                  "steps": [
                    {
                      "color": "green",
                      "value": null
                    },
                    {
                      "color": "red",
                      "value": 80
                    }
                  ]
                },
                "unit": "bytes"
              },
              "overrides": []
            },
            "gridPos": {
              "h": 8,
              "w": 12,
              "x": 12,
              "y": 11
            },
            "id": 7,
            "options": {
              "legend": {
                "calcs": [],
                "displayMode": "list",
                "placement": "bottom",
                "showLegend": false
              },
              "tooltip": {
                "mode": "multi",
                "sort": "none"
              }
            },
            "pluginVersion": "8.3.3",
            "targets": [
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "$${datasource}"
                },
                "exemplar": true,
                "expr": "sum(rate(coredns_dns_request_size_bytes_sum{instance=~\"$instance\",proto=\"$protocol\"}[$__rate_interval])) by (proto) / sum(rate(coredns_dns_request_size_bytes_count{instance=~\"$instance\",proto=\"$protocol\"}[$__rate_interval])) by (proto)",
                "interval": "$resolution",
                "legendFormat": "average $protocol packet size",
                "refId": "A"
              }
            ],
            "title": "CoreDNS - Average Packet Size  ($protocol)",
            "type": "timeseries"
          },
          {
            "datasource": {
              "type": "prometheus",
              "uid": "$${datasource}"
            },
            "fieldConfig": {
              "defaults": {
                "color": {
                  "mode": "palette-classic"
                },
                "custom": {
                  "axisCenteredZero": false,
                  "axisColorMode": "text",
                  "axisLabel": "",
                  "axisPlacement": "auto",
                  "barAlignment": 0,
                  "drawStyle": "line",
                  "fillOpacity": 25,
                  "gradientMode": "opacity",
                  "hideFrom": {
                    "legend": false,
                    "tooltip": false,
                    "viz": false
                  },
                  "lineInterpolation": "smooth",
                  "lineWidth": 2,
                  "pointSize": 5,
                  "scaleDistribution": {
                    "type": "linear"
                  },
                  "showPoints": "never",
                  "spanNulls": false,
                  "stacking": {
                    "group": "A",
                    "mode": "none"
                  },
                  "thresholdsStyle": {
                    "mode": "off"
                  }
                },
                "mappings": [],
                "thresholds": {
                  "mode": "absolute",
                  "steps": [
                    {
                      "color": "green",
                      "value": null
                    },
                    {
                      "color": "red",
                      "value": 80
                    }
                  ]
                },
                "unit": "short"
              },
              "overrides": []
            },
            "gridPos": {
              "h": 8,
              "w": 12,
              "x": 0,
              "y": 19
            },
            "id": 2,
            "options": {
              "legend": {
                "calcs": [],
                "displayMode": "list",
                "placement": "bottom",
                "showLegend": true
              },
              "tooltip": {
                "mode": "multi",
                "sort": "desc"
              }
            },
            "pluginVersion": "8.3.3",
            "targets": [
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "$${datasource}"
                },
                "exemplar": true,
                "expr": "sum(rate(coredns_dns_requests_total{instance=~\"$instance\"}[$__rate_interval])) by (type)",
                "interval": "$resolution",
                "legendFormat": "{{ type }}",
                "refId": "A"
              }
            ],
            "title": "CoreDNS - Requests by type",
            "type": "timeseries"
          },
          {
            "datasource": {
              "type": "prometheus",
              "uid": "$${datasource}"
            },
            "fieldConfig": {
              "defaults": {
                "color": {
                  "mode": "palette-classic"
                },
                "custom": {
                  "axisCenteredZero": false,
                  "axisColorMode": "text",
                  "axisLabel": "",
                  "axisPlacement": "auto",
                  "barAlignment": 0,
                  "drawStyle": "line",
                  "fillOpacity": 25,
                  "gradientMode": "opacity",
                  "hideFrom": {
                    "legend": false,
                    "tooltip": false,
                    "viz": false
                  },
                  "lineInterpolation": "smooth",
                  "lineWidth": 2,
                  "pointSize": 5,
                  "scaleDistribution": {
                    "type": "linear"
                  },
                  "showPoints": "never",
                  "spanNulls": false,
                  "stacking": {
                    "group": "A",
                    "mode": "none"
                  },
                  "thresholdsStyle": {
                    "mode": "off"
                  }
                },
                "mappings": [],
                "thresholds": {
                  "mode": "absolute",
                  "steps": [
                    {
                      "color": "green",
                      "value": null
                    },
                    {
                      "color": "red",
                      "value": 80
                    }
                  ]
                },
                "unit": "short"
              },
              "overrides": []
            },
            "gridPos": {
              "h": 8,
              "w": 12,
              "x": 12,
              "y": 19
            },
            "id": 4,
            "options": {
              "legend": {
                "calcs": [],
                "displayMode": "list",
                "placement": "bottom",
                "showLegend": true
              },
              "tooltip": {
                "mode": "multi",
                "sort": "desc"
              }
            },
            "pluginVersion": "8.3.3",
            "targets": [
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "$${datasource}"
                },
                "exemplar": true,
                "expr": "sum(rate(coredns_dns_responses_total{instance=~\"$instance\"}[$__rate_interval])) by (rcode)",
                "interval": "$resolution",
                "legendFormat": "{{ rcode }}",
                "refId": "A"
              }
            ],
            "title": "CoreDNS - Requests by return code",
            "type": "timeseries"
          },
          {
            "datasource": {
              "type": "prometheus",
              "uid": "$${datasource}"
            },
            "fieldConfig": {
              "defaults": {
                "color": {
                  "mode": "palette-classic"
                },
                "custom": {
                  "axisCenteredZero": false,
                  "axisColorMode": "text",
                  "axisLabel": "",
                  "axisPlacement": "auto",
                  "barAlignment": 0,
                  "drawStyle": "line",
                  "fillOpacity": 25,
                  "gradientMode": "opacity",
                  "hideFrom": {
                    "legend": false,
                    "tooltip": false,
                    "viz": false
                  },
                  "lineInterpolation": "smooth",
                  "lineWidth": 2,
                  "pointSize": 5,
                  "scaleDistribution": {
                    "type": "linear"
                  },
                  "showPoints": "never",
                  "spanNulls": false,
                  "stacking": {
                    "group": "A",
                    "mode": "none"
                  },
                  "thresholdsStyle": {
                    "mode": "off"
                  }
                },
                "mappings": [],
                "thresholds": {
                  "mode": "absolute",
                  "steps": [
                    {
                      "color": "green",
                      "value": null
                    },
                    {
                      "color": "red",
                      "value": 80
                    }
                  ]
                },
                "unit": "short"
              },
              "overrides": []
            },
            "gridPos": {
              "h": 8,
              "w": 12,
              "x": 0,
              "y": 27
            },
            "id": 23,
            "options": {
              "legend": {
                "calcs": [],
                "displayMode": "list",
                "placement": "bottom",
                "showLegend": false
              },
              "tooltip": {
                "mode": "multi",
                "sort": "none"
              }
            },
            "pluginVersion": "8.3.3",
            "targets": [
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "$${datasource}"
                },
                "exemplar": true,
                "expr": "sum(rate(coredns_forward_requests_total[$__rate_interval]))",
                "interval": "$resolution",
                "legendFormat": "total forward requests",
                "refId": "A"
              }
            ],
            "title": "CoreDNS - Total Forward Requests",
            "type": "timeseries"
          },
          {
            "datasource": {
              "type": "prometheus",
              "uid": "$${datasource}"
            },
            "fieldConfig": {
              "defaults": {
                "color": {
                  "mode": "palette-classic"
                },
                "custom": {
                  "axisCenteredZero": false,
                  "axisColorMode": "text",
                  "axisLabel": "",
                  "axisPlacement": "auto",
                  "barAlignment": 0,
                  "drawStyle": "line",
                  "fillOpacity": 25,
                  "gradientMode": "opacity",
                  "hideFrom": {
                    "legend": false,
                    "tooltip": false,
                    "viz": false
                  },
                  "lineInterpolation": "smooth",
                  "lineWidth": 2,
                  "pointSize": 5,
                  "scaleDistribution": {
                    "type": "linear"
                  },
                  "showPoints": "never",
                  "spanNulls": false,
                  "stacking": {
                    "group": "A",
                    "mode": "none"
                  },
                  "thresholdsStyle": {
                    "mode": "off"
                  }
                },
                "mappings": [],
                "thresholds": {
                  "mode": "absolute",
                  "steps": [
                    {
                      "color": "green",
                      "value": null
                    },
                    {
                      "color": "red",
                      "value": 80
                    }
                  ]
                },
                "unit": "short"
              },
              "overrides": []
            },
            "gridPos": {
              "h": 8,
              "w": 12,
              "x": 12,
              "y": 27
            },
            "id": 13,
            "options": {
              "legend": {
                "calcs": [],
                "displayMode": "list",
                "placement": "bottom",
                "showLegend": true
              },
              "tooltip": {
                "mode": "multi",
                "sort": "none"
              }
            },
            "pluginVersion": "8.3.3",
            "targets": [
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "$${datasource}"
                },
                "exemplar": true,
                "expr": "sum(rate(coredns_forward_responses_total{rcode=~\"SERVFAIL|REFUSED\"}[$__rate_interval])) by (rcode)",
                "interval": "$resolution",
                "legendFormat": "{{ rcode }}",
                "refId": "A"
              }
            ],
            "title": "CoreDNS - DNS Errors",
            "type": "timeseries"
          },
          {
            "datasource": {
              "type": "prometheus",
              "uid": "$${datasource}"
            },
            "fieldConfig": {
              "defaults": {
                "color": {
                  "mode": "palette-classic"
                },
                "custom": {
                  "axisCenteredZero": false,
                  "axisColorMode": "text",
                  "axisLabel": "",
                  "axisPlacement": "auto",
                  "barAlignment": 0,
                  "drawStyle": "line",
                  "fillOpacity": 25,
                  "gradientMode": "opacity",
                  "hideFrom": {
                    "legend": false,
                    "tooltip": false,
                    "viz": false
                  },
                  "lineInterpolation": "smooth",
                  "lineWidth": 2,
                  "pointSize": 5,
                  "scaleDistribution": {
                    "type": "linear"
                  },
                  "showPoints": "never",
                  "spanNulls": false,
                  "stacking": {
                    "group": "A",
                    "mode": "none"
                  },
                  "thresholdsStyle": {
                    "mode": "off"
                  }
                },
                "mappings": [],
                "thresholds": {
                  "mode": "absolute",
                  "steps": [
                    {
                      "color": "green",
                      "value": null
                    },
                    {
                      "color": "red",
                      "value": 80
                    }
                  ]
                },
                "unit": "short"
              },
              "overrides": []
            },
            "gridPos": {
              "h": 8,
              "w": 12,
              "x": 0,
              "y": 35
            },
            "id": 17,
            "options": {
              "legend": {
                "calcs": [],
                "displayMode": "list",
                "placement": "bottom",
                "showLegend": true
              },
              "tooltip": {
                "mode": "multi",
                "sort": "desc"
              }
            },
            "pluginVersion": "8.3.3",
            "targets": [
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "$${datasource}"
                },
                "exemplar": true,
                "expr": "sum(rate(coredns_cache_hits_total{instance=~\"$instance\"}[$__rate_interval])) by (type)",
                "interval": "$resolution",
                "legendFormat": "{{ type }}",
                "refId": "A"
              },
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "$${datasource}"
                },
                "exemplar": true,
                "expr": "sum(rate(coredns_cache_misses_total{instance=~\"$instance\"}[$__rate_interval])) by (type)",
                "interval": "$resolution",
                "legendFormat": "misses",
                "refId": "B"
              }
            ],
            "title": "CoreDNS - Cache Hits / Misses",
            "type": "timeseries"
          },
          {
            "datasource": {
              "type": "prometheus",
              "uid": "$${datasource}"
            },
            "fieldConfig": {
              "defaults": {
                "color": {
                  "mode": "palette-classic"
                },
                "custom": {
                  "axisCenteredZero": false,
                  "axisColorMode": "text",
                  "axisLabel": "",
                  "axisPlacement": "auto",
                  "barAlignment": 0,
                  "drawStyle": "line",
                  "fillOpacity": 25,
                  "gradientMode": "opacity",
                  "hideFrom": {
                    "legend": false,
                    "tooltip": false,
                    "viz": false
                  },
                  "lineInterpolation": "smooth",
                  "lineWidth": 2,
                  "pointSize": 5,
                  "scaleDistribution": {
                    "type": "linear"
                  },
                  "showPoints": "never",
                  "spanNulls": false,
                  "stacking": {
                    "group": "A",
                    "mode": "none"
                  },
                  "thresholdsStyle": {
                    "mode": "off"
                  }
                },
                "mappings": [],
                "thresholds": {
                  "mode": "absolute",
                  "steps": [
                    {
                      "color": "green",
                      "value": null
                    },
                    {
                      "color": "red",
                      "value": 80
                    }
                  ]
                },
                "unit": "bytes"
              },
              "overrides": []
            },
            "gridPos": {
              "h": 8,
              "w": 12,
              "x": 12,
              "y": 35
            },
            "id": 15,
            "options": {
              "legend": {
                "calcs": [],
                "displayMode": "list",
                "placement": "bottom",
                "showLegend": true
              },
              "tooltip": {
                "mode": "multi",
                "sort": "desc"
              }
            },
            "pluginVersion": "8.3.3",
            "targets": [
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "$${datasource}"
                },
                "exemplar": true,
                "expr": "sum(coredns_cache_entries) by (type)",
                "interval": "",
                "legendFormat": "{{ type }}",
                "refId": "A"
              }
            ],
            "title": "CoreDNS - Cache Size",
            "type": "timeseries"
          },
          {
            "datasource": {
              "type": "prometheus",
              "uid": "$${datasource}"
            },
            "fieldConfig": {
              "defaults": {
                "custom": {
                  "hideFrom": {
                    "legend": false,
                    "tooltip": false,
                    "viz": false
                  },
                  "scaleDistribution": {
                    "type": "linear"
                  }
                }
              },
              "overrides": []
            },
            "gridPos": {
              "h": 10,
              "w": 12,
              "x": 0,
              "y": 43
            },
            "id": 27,
            "options": {
              "calculate": false,
              "cellGap": 1,
              "color": {
                "exponent": 0.5,
                "fill": "dark-orange",
                "mode": "scheme",
                "reverse": false,
                "scale": "exponential",
                "scheme": "RdYlBu",
                "steps": 64
              },
              "exemplars": {
                "color": "rgba(255,0,255,0.7)"
              },
              "filterValues": {
                "le": 1e-9
              },
              "legend": {
                "show": true
              },
              "rowsFrame": {
                "layout": "auto"
              },
              "tooltip": {
                "show": true,
                "yHistogram": false
              },
              "yAxis": {
                "axisPlacement": "left",
                "reverse": false,
                "unit": "s"
              }
            },
            "pluginVersion": "10.0.1",
            "targets": [
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "$${datasource}"
                },
                "editorMode": "code",
                "expr": "sum(increase(coredns_dns_request_duration_seconds_bucket{instance=~\"$instance\"}[$__rate_interval])) by (le)",
                "format": "heatmap",
                "legendFormat": "{{le}}",
                "range": true,
                "refId": "A"
              }
            ],
            "title": "CoreDNS - DNS request duration",
            "type": "heatmap"
          },
          {
            "datasource": {
              "type": "prometheus",
              "uid": "$${datasource}"
            },
            "fieldConfig": {
              "defaults": {
                "custom": {
                  "hideFrom": {
                    "legend": false,
                    "tooltip": false,
                    "viz": false
                  },
                  "scaleDistribution": {
                    "type": "linear"
                  }
                }
              },
              "overrides": []
            },
            "gridPos": {
              "h": 10,
              "w": 12,
              "x": 12,
              "y": 43
            },
            "id": 30,
            "options": {
              "calculate": false,
              "cellGap": 1,
              "color": {
                "exponent": 0.5,
                "fill": "dark-orange",
                "mode": "scheme",
                "reverse": false,
                "scale": "exponential",
                "scheme": "RdYlBu",
                "steps": 64
              },
              "exemplars": {
                "color": "rgba(255,0,255,0.7)"
              },
              "filterValues": {
                "le": 1e-9
              },
              "legend": {
                "show": true
              },
              "rowsFrame": {
                "layout": "auto"
              },
              "tooltip": {
                "show": true,
                "yHistogram": false
              },
              "yAxis": {
                "axisPlacement": "left",
                "reverse": false,
                "unit": "s"
              }
            },
            "pluginVersion": "10.0.1",
            "targets": [
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "$${datasource}"
                },
                "editorMode": "code",
                "expr": "sum(increase(coredns_forward_request_duration_seconds_bucket{instance=~\"$instance\"}[$__rate_interval])) by (le)",
                "format": "heatmap",
                "legendFormat": "{{le}}",
                "range": true,
                "refId": "A"
              }
            ],
            "title": "CoreDNS - Forward request duration",
            "type": "heatmap"
          },
          {
            "datasource": {
              "type": "prometheus",
              "uid": "$${datasource}"
            },
            "fieldConfig": {
              "defaults": {
                "custom": {
                  "hideFrom": {
                    "legend": false,
                    "tooltip": false,
                    "viz": false
                  },
                  "scaleDistribution": {
                    "type": "linear"
                  }
                }
              },
              "overrides": []
            },
            "gridPos": {
              "h": 10,
              "w": 12,
              "x": 0,
              "y": 53
            },
            "id": 28,
            "options": {
              "calculate": false,
              "cellGap": 1,
              "color": {
                "exponent": 0.5,
                "fill": "dark-orange",
                "mode": "scheme",
                "reverse": false,
                "scale": "exponential",
                "scheme": "RdYlBu",
                "steps": 64
              },
              "exemplars": {
                "color": "rgba(255,0,255,0.7)"
              },
              "filterValues": {
                "le": 1e-9
              },
              "legend": {
                "show": true
              },
              "rowsFrame": {
                "layout": "auto"
              },
              "tooltip": {
                "show": true,
                "yHistogram": false
              },
              "yAxis": {
                "axisPlacement": "left",
                "reverse": false,
                "unit": "decbytes"
              }
            },
            "pluginVersion": "10.0.1",
            "targets": [
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "$${datasource}"
                },
                "editorMode": "code",
                "expr": "sum(increase(coredns_dns_request_size_bytes_bucket{instance=~\"$instance\", le!=\"0\"}[$__rate_interval])) by (le)",
                "format": "heatmap",
                "legendFormat": "{{le}}",
                "range": true,
                "refId": "A"
              }
            ],
            "title": "CoreDNS - DNS request size",
            "type": "heatmap"
          },
          {
            "datasource": {
              "type": "prometheus",
              "uid": "$${datasource}"
            },
            "fieldConfig": {
              "defaults": {
                "custom": {
                  "hideFrom": {
                    "legend": false,
                    "tooltip": false,
                    "viz": false
                  },
                  "scaleDistribution": {
                    "type": "linear"
                  }
                }
              },
              "overrides": []
            },
            "gridPos": {
              "h": 10,
              "w": 12,
              "x": 12,
              "y": 53
            },
            "id": 29,
            "options": {
              "calculate": false,
              "cellGap": 1,
              "color": {
                "exponent": 0.5,
                "fill": "dark-orange",
                "mode": "scheme",
                "reverse": false,
                "scale": "exponential",
                "scheme": "RdYlBu",
                "steps": 64
              },
              "exemplars": {
                "color": "rgba(255,0,255,0.7)"
              },
              "filterValues": {
                "le": 1e-9
              },
              "legend": {
                "show": true
              },
              "rowsFrame": {
                "layout": "auto"
              },
              "tooltip": {
                "show": true,
                "yHistogram": false
              },
              "yAxis": {
                "axisPlacement": "left",
                "reverse": false,
                "unit": "decbytes"
              }
            },
            "pluginVersion": "10.0.1",
            "targets": [
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "$${datasource}"
                },
                "editorMode": "code",
                "expr": "sum(increase(coredns_dns_response_size_bytes_bucket{instance=~\"$instance\", le!=\"0\"}[$__rate_interval])) by (le)",
                "format": "heatmap",
                "legendFormat": "{{le}}",
                "range": true,
                "refId": "A"
              }
            ],
            "title": "CoreDNS - DNS response size",
            "type": "heatmap"
          }
        ],
        "refresh": "30s",
        "schemaVersion": 38,
        "style": "dark",
        "tags": [
          "Kubernetes",
          "Prometheus"
        ],
        "templating": {
          "list": [
            {
              "current": {
                "selected": false,
                "text": "Prometheus",
                "value": "Prometheus"
              },
              "hide": 0,
              "includeAll": false,
              "multi": false,
              "name": "datasource",
              "options": [],
              "query": "prometheus",
              "queryValue": "",
              "refresh": 1,
              "regex": "",
              "skipUrlSync": false,
              "type": "datasource"
            },
            {
              "current": {
                "selected": false,
                "text": "All",
                "value": "$__all"
              },
              "datasource": {
                "type": "prometheus",
                "uid": "$${datasource}"
              },
              "definition": "label_values(up{job=\"coredns\"}, instance)",
              "hide": 0,
              "includeAll": true,
              "label": "",
              "multi": false,
              "name": "instance",
              "options": [],
              "query": {
                "query": "label_values(up{job=\"coredns\"}, instance)",
                "refId": "StandardVariableQuery"
              },
              "refresh": 1,
              "regex": "",
              "skipUrlSync": false,
              "sort": 1,
              "tagValuesQuery": "",
              "tagsQuery": "",
              "type": "query",
              "useTags": false
            },
            {
              "allValue": "udp,tcp",
              "current": {
                "selected": false,
                "text": "udp",
                "value": "udp"
              },
              "datasource": {
                "type": "prometheus",
                "uid": "$${datasource}"
              },
              "definition": "label_values(coredns_dns_requests_total, proto)",
              "hide": 0,
              "includeAll": false,
              "label": "",
              "multi": false,
              "name": "protocol",
              "options": [],
              "query": {
                "query": "label_values(coredns_dns_requests_total, proto)",
                "refId": "StandardVariableQuery"
              },
              "refresh": 1,
              "regex": "",
              "skipUrlSync": false,
              "sort": 1,
              "tagValuesQuery": "",
              "tagsQuery": "",
              "type": "query",
              "useTags": false
            },
            {
              "current": {
                "selected": true,
                "text": "30s",
                "value": "30s"
              },
              "hide": 0,
              "includeAll": false,
              "multi": false,
              "name": "resolution",
              "options": [
                {
                  "selected": false,
                  "text": "1s",
                  "value": "1s"
                },
                {
                  "selected": false,
                  "text": "15s",
                  "value": "15s"
                },
                {
                  "selected": true,
                  "text": "30s",
                  "value": "30s"
                },
                {
                  "selected": false,
                  "text": "1m",
                  "value": "1m"
                },
                {
                  "selected": false,
                  "text": "3m",
                  "value": "3m"
                },
                {
                  "selected": false,
                  "text": "5m",
                  "value": "5m"
                }
              ],
              "query": "1s, 15s, 30s, 1m, 3m, 5m",
              "queryValue": "",
              "skipUrlSync": false,
              "type": "custom"
            }
          ]
        },
        "time": {
          "from": "now-1h",
          "to": "now"
        },
        "timepicker": {},
        "timezone": "",
        "title": "Kubernetes / System / CoreDNS",
        "uid": "k8s_system_coredns",
        "version": 13,
        "weekStart": ""
      }
      
      EOT
    }
    "kind" = "ConfigMap"
    "metadata" = {
      "annotations" = {
        "grafana_folder" = "Kubernetes"
      }
      "labels" = {
        "grafana_dashboard" = "1"
      }
      "name"      = "dashboards-k8s-system-coredns"
      "namespace" = "prometheus"
    }
  }
}

resource "kubernetes_manifest" "configmap_prometheus_dashboards_k8s_views_global" {
  manifest = {
    "apiVersion" = "v1"
    "data" = {
      "k8s-views-global.json" = <<-EOT
      {
        "__inputs": [
          {
            "name": "DS_PROMETHEUS",
            "label": "Prometheus",
            "description": "",
            "type": "datasource",
            "pluginId": "prometheus",
            "pluginName": "Prometheus"
          }
        ],
        "__elements": [],
        "__requires": [
          {
            "type": "grafana",
            "id": "grafana",
            "name": "Grafana",
            "version": "8.3.4"
          },
          {
            "type": "datasource",
            "id": "prometheus",
            "name": "Prometheus",
            "version": "5.0.0"
          },
          {
            "type": "panel",
            "id": "timeseries",
            "name": "Time series",
            "version": ""
          },
          {
            "type": "panel",
            "id": "stat",
            "name": "Stat",
            "version": ""
          },
          {
            "type": "panel",
            "id": "gauge",
            "name": "Gauge",
            "version": ""
          }
        ],
        "annotations": {
          "list": [
            {
              "builtIn": 1,
              "datasource": {
                "type": "datasource",
                "uid": "grafana"
              },
              "enable": true,
              "hide": true,
              "iconColor": "rgba(0, 211, 255, 1)",
              "name": "Annotations & Alerts",
              "target": {
                "limit": 100,
                "matchAny": false,
                "tags": [],
                "type": "dashboard"
              },
              "type": "dashboard"
            }
          ]
        },
        "description": "This is a modern 'Global View' dashboard for your Kubernetes cluster(s). Made for kube-prometheus-stack and take advantage of the latest Grafana features. GitHub repository: https://github.com/dotdc/grafana-dashboards-kubernetes",
        "editable": true,
        "fiscalYearStartMonth": 0,
        "graphTooltip": 1,
        "links": [],
        "liveNow": false,
        "panels": [
          {
            "collapsed": false,
            "datasource": {
              "type": "prometheus",
              "uid": "prometheus"
            },
            "gridPos": {
              "h": 1,
              "w": 24,
              "x": 0,
              "y": 0
            },
            "id": 67,
            "panels": [],
            "title": "Overview",
            "type": "row"
          },
          {
            "datasource": {
              "type": "prometheus",
              "uid": "$${datasource}"
            },
            "fieldConfig": {
              "defaults": {
                "color": {
                  "mode": "continuous-GrYlRd"
                },
                "mappings": [],
                "max": 1,
                "min": 0,
                "thresholds": {
                  "mode": "absolute",
                  "steps": [
                    {
                      "color": "green",
                      "value": null
                    },
                    {
                      "color": "red",
                      "value": 80
                    }
                  ]
                },
                "unit": "percentunit"
              },
              "overrides": []
            },
            "gridPos": {
              "h": 8,
              "w": 6,
              "x": 0,
              "y": 1
            },
            "id": 77,
            "options": {
              "displayMode": "lcd",
              "minVizHeight": 10,
              "minVizWidth": 0,
              "orientation": "horizontal",
              "reduceOptions": {
                "calcs": [
                  "lastNotNull"
                ],
                "fields": "",
                "values": false
              },
              "showUnfilled": true,
              "valueMode": "color"
            },
            "pluginVersion": "10.0.3",
            "targets": [
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "$${datasource}"
                },
                "editorMode": "code",
                "exemplar": true,
                "expr": "avg(1-rate(node_cpu_seconds_total{mode=\"idle\"}[$__rate_interval]))",
                "interval": "",
                "legendFormat": "Real",
                "range": true,
                "refId": "A"
              },
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "$${datasource}"
                },
                "editorMode": "code",
                "expr": "sum(kube_pod_container_resource_requests{resource=\"cpu\"}) / sum(machine_cpu_cores)",
                "hide": false,
                "legendFormat": "Requests",
                "range": true,
                "refId": "B"
              },
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "$${datasource}"
                },
                "editorMode": "code",
                "expr": "sum(kube_pod_container_resource_limits{resource=\"cpu\"}) / sum(machine_cpu_cores)",
                "hide": false,
                "legendFormat": "Limits",
                "range": true,
                "refId": "C"
              }
            ],
            "title": "Global CPU  Usage",
            "type": "bargauge"
          },
          {
            "datasource": {
              "type": "prometheus",
              "uid": "$${datasource}"
            },
            "fieldConfig": {
              "defaults": {
                "color": {
                  "mode": "continuous-GrYlRd"
                },
                "decimals": 2,
                "mappings": [],
                "max": 1,
                "min": 0,
                "thresholds": {
                  "mode": "percentage",
                  "steps": [
                    {
                      "color": "green",
                      "value": null
                    },
                    {
                      "color": "red",
                      "value": 80
                    }
                  ]
                },
                "unit": "percentunit"
              },
              "overrides": []
            },
            "gridPos": {
              "h": 8,
              "w": 6,
              "x": 6,
              "y": 1
            },
            "id": 78,
            "options": {
              "displayMode": "lcd",
              "minVizHeight": 10,
              "minVizWidth": 0,
              "orientation": "horizontal",
              "reduceOptions": {
                "calcs": [
                  "lastNotNull"
                ],
                "fields": "",
                "values": false
              },
              "showUnfilled": true,
              "text": {},
              "valueMode": "color"
            },
            "pluginVersion": "10.0.3",
            "targets": [
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "$${datasource}"
                },
                "editorMode": "code",
                "exemplar": true,
                "expr": "sum(node_memory_MemTotal_bytes - node_memory_MemAvailable_bytes) / sum(node_memory_MemTotal_bytes)",
                "interval": "",
                "legendFormat": "Real",
                "range": true,
                "refId": "A"
              },
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "$${datasource}"
                },
                "editorMode": "code",
                "expr": "sum(kube_pod_container_resource_requests{resource=\"memory\"}) / sum(machine_memory_bytes)",
                "hide": false,
                "legendFormat": "Requests",
                "range": true,
                "refId": "B"
              },
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "$${datasource}"
                },
                "editorMode": "code",
                "expr": "sum(kube_pod_container_resource_limits{resource=\"memory\"}) / sum(machine_memory_bytes)",
                "hide": false,
                "legendFormat": "Limits",
                "range": true,
                "refId": "C"
              }
            ],
            "title": "Global RAM Usage",
            "type": "bargauge"
          },
          {
            "datasource": {
              "type": "prometheus",
              "uid": "$${datasource}"
            },
            "fieldConfig": {
              "defaults": {
                "mappings": [],
                "noValue": "0",
                "thresholds": {
                  "mode": "absolute",
                  "steps": [
                    {
                      "color": "blue",
                      "value": null
                    }
                  ]
                }
              },
              "overrides": []
            },
            "gridPos": {
              "h": 4,
              "w": 2,
              "x": 12,
              "y": 1
            },
            "id": 63,
            "options": {
              "colorMode": "value",
              "graphMode": "none",
              "justifyMode": "auto",
              "orientation": "auto",
              "reduceOptions": {
                "calcs": [
                  "last"
                ],
                "fields": "",
                "values": false
              },
              "text": {},
              "textMode": "value"
            },
            "pluginVersion": "10.0.3",
            "targets": [
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "$${datasource}"
                },
                "exemplar": true,
                "expr": "count(count by (node) (kube_node_info))",
                "interval": "",
                "legendFormat": "",
                "refId": "A"
              }
            ],
            "title": "Nodes",
            "type": "stat"
          },
          {
            "datasource": {
              "type": "prometheus",
              "uid": "$${datasource}"
            },
            "fieldConfig": {
              "defaults": {
                "color": {
                  "mode": "palette-classic"
                },
                "custom": {
                  "axisCenteredZero": false,
                  "axisColorMode": "text",
                  "axisLabel": "",
                  "axisPlacement": "auto",
                  "barAlignment": 0,
                  "drawStyle": "line",
                  "fillOpacity": 25,
                  "gradientMode": "opacity",
                  "hideFrom": {
                    "legend": false,
                    "tooltip": false,
                    "viz": false
                  },
                  "lineInterpolation": "smooth",
                  "lineWidth": 2,
                  "pointSize": 5,
                  "scaleDistribution": {
                    "type": "linear"
                  },
                  "showPoints": "never",
                  "spanNulls": false,
                  "stacking": {
                    "group": "A",
                    "mode": "none"
                  },
                  "thresholdsStyle": {
                    "mode": "off"
                  }
                },
                "mappings": [],
                "thresholds": {
                  "mode": "absolute",
                  "steps": [
                    {
                      "color": "green",
                      "value": null
                    },
                    {
                      "color": "red",
                      "value": 80
                    }
                  ]
                },
                "unit": "short"
              },
              "overrides": []
            },
            "gridPos": {
              "h": 12,
              "w": 10,
              "x": 14,
              "y": 1
            },
            "id": 52,
            "options": {
              "legend": {
                "calcs": [
                  "min",
                  "max",
                  "mean"
                ],
                "displayMode": "table",
                "placement": "right",
                "showLegend": true,
                "sortBy": "Max",
                "sortDesc": true
              },
              "tooltip": {
                "mode": "multi",
                "sort": "none"
              }
            },
            "pluginVersion": "8.3.3",
            "targets": [
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "$${datasource}"
                },
                "exemplar": true,
                "expr": "sum(kube_namespace_labels)",
                "interval": "",
                "legendFormat": "Namespaces",
                "refId": "A"
              },
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "$${datasource}"
                },
                "expr": "sum(kube_pod_container_status_running)",
                "interval": "",
                "legendFormat": "Running Containers",
                "refId": "B"
              },
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "$${datasource}"
                },
                "expr": "sum(kube_pod_status_phase{phase=\"Running\"})",
                "interval": "",
                "legendFormat": "Running Pods",
                "refId": "O"
              },
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "$${datasource}"
                },
                "expr": "sum(kube_service_info)",
                "interval": "",
                "legendFormat": "Services",
                "refId": "C"
              },
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "$${datasource}"
                },
                "expr": "sum(kube_endpoint_info)",
                "interval": "",
                "legendFormat": "Endpoints",
                "refId": "D"
              },
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "$${datasource}"
                },
                "expr": "sum(kube_ingress_info)",
                "interval": "",
                "legendFormat": "Ingresses",
                "refId": "E"
              },
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "$${datasource}"
                },
                "expr": "sum(kube_deployment_labels)",
                "interval": "",
                "legendFormat": "Deployments",
                "refId": "F"
              },
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "$${datasource}"
                },
                "expr": "sum(kube_statefulset_labels)",
                "interval": "",
                "legendFormat": "Statefulsets",
                "refId": "G"
              },
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "$${datasource}"
                },
                "expr": "sum(kube_daemonset_labels)",
                "interval": "",
                "legendFormat": "Daemonsets",
                "refId": "H"
              },
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "$${datasource}"
                },
                "expr": "sum(kube_persistentvolumeclaim_info)",
                "interval": "",
                "legendFormat": "Persistent Volume Claims",
                "refId": "I"
              },
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "$${datasource}"
                },
                "expr": "sum(kube_hpa_labels)",
                "interval": "",
                "legendFormat": "Horizontal Pod Autoscalers",
                "refId": "J"
              },
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "$${datasource}"
                },
                "expr": "sum(kube_configmap_info)",
                "interval": "",
                "legendFormat": "Configmaps",
                "refId": "K"
              },
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "$${datasource}"
                },
                "expr": "sum(kube_secret_info)",
                "interval": "",
                "legendFormat": "Secrets",
                "refId": "L"
              },
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "$${datasource}"
                },
                "expr": "sum(kube_networkpolicy_labels)",
                "interval": "",
                "legendFormat": "Network Policies",
                "refId": "M"
              },
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "$${datasource}"
                },
                "exemplar": true,
                "expr": "count(count by (node) (kube_node_info))",
                "hide": false,
                "interval": "",
                "legendFormat": "Nodes",
                "refId": "N"
              }
            ],
            "title": "Kubernetes Resource Count",
            "type": "timeseries"
          },
          {
            "datasource": {
              "type": "prometheus",
              "uid": "$${datasource}"
            },
            "fieldConfig": {
              "defaults": {
                "mappings": [],
                "noValue": "0",
                "thresholds": {
                  "mode": "absolute",
                  "steps": [
                    {
                      "color": "blue",
                      "value": null
                    }
                  ]
                }
              },
              "overrides": []
            },
            "gridPos": {
              "h": 4,
              "w": 2,
              "x": 12,
              "y": 5
            },
            "id": 59,
            "options": {
              "colorMode": "value",
              "graphMode": "none",
              "justifyMode": "auto",
              "orientation": "auto",
              "reduceOptions": {
                "calcs": [
                  "last"
                ],
                "fields": "",
                "values": false
              },
              "text": {},
              "textMode": "value"
            },
            "pluginVersion": "10.0.3",
            "targets": [
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "$${datasource}"
                },
                "expr": "count(kube_namespace_created)",
                "interval": "",
                "legendFormat": "",
                "refId": "A"
              }
            ],
            "title": "Namespaces",
            "type": "stat"
          },
          {
            "datasource": {
              "type": "prometheus",
              "uid": "$${datasource}"
            },
            "fieldConfig": {
              "defaults": {
                "mappings": [],
                "noValue": "0",
                "thresholds": {
                  "mode": "absolute",
                  "steps": [
                    {
                      "color": "rgb(255, 255, 255)",
                      "value": null
                    }
                  ]
                },
                "unit": "none"
              },
              "overrides": []
            },
            "gridPos": {
              "h": 4,
              "w": 6,
              "x": 0,
              "y": 9
            },
            "id": 37,
            "options": {
              "colorMode": "none",
              "graphMode": "none",
              "justifyMode": "center",
              "orientation": "auto",
              "reduceOptions": {
                "calcs": [
                  "mean"
                ],
                "fields": "",
                "values": false
              },
              "text": {},
              "textMode": "auto"
            },
            "pluginVersion": "10.0.3",
            "targets": [
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "$${datasource}"
                },
                "editorMode": "code",
                "exemplar": true,
                "expr": "sum(1-rate(node_cpu_seconds_total{mode=\"idle\"}[$__rate_interval]))",
                "interval": "",
                "legendFormat": "Real",
                "range": true,
                "refId": "A"
              },
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "$${datasource}"
                },
                "editorMode": "code",
                "expr": "sum(kube_pod_container_resource_requests{resource=\"cpu\"})",
                "hide": false,
                "legendFormat": "Requests",
                "range": true,
                "refId": "B"
              },
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "$${datasource}"
                },
                "editorMode": "code",
                "expr": "sum(kube_pod_container_resource_limits{resource=\"cpu\"})",
                "hide": false,
                "legendFormat": "Limits",
                "range": true,
                "refId": "C"
              },
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "$${datasource}"
                },
                "editorMode": "code",
                "expr": "sum(machine_cpu_cores)",
                "hide": false,
                "legendFormat": "Total",
                "range": true,
                "refId": "D"
              }
            ],
            "title": "CPU Usage",
            "type": "stat"
          },
          {
            "datasource": {
              "type": "prometheus",
              "uid": "$${datasource}"
            },
            "fieldConfig": {
              "defaults": {
                "mappings": [],
                "noValue": "0",
                "thresholds": {
                  "mode": "absolute",
                  "steps": [
                    {
                      "color": "rgb(255, 255, 255)",
                      "value": null
                    }
                  ]
                },
                "unit": "bytes"
              },
              "overrides": []
            },
            "gridPos": {
              "h": 4,
              "w": 6,
              "x": 6,
              "y": 9
            },
            "id": 39,
            "options": {
              "colorMode": "none",
              "graphMode": "none",
              "justifyMode": "auto",
              "orientation": "auto",
              "reduceOptions": {
                "calcs": [
                  "mean"
                ],
                "fields": "",
                "values": false
              },
              "text": {},
              "textMode": "auto"
            },
            "pluginVersion": "10.0.3",
            "targets": [
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "$${datasource}"
                },
                "editorMode": "code",
                "exemplar": true,
                "expr": "sum(node_memory_MemTotal_bytes - node_memory_MemAvailable_bytes)",
                "interval": "",
                "legendFormat": "Real",
                "range": true,
                "refId": "A"
              },
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "$${datasource}"
                },
                "editorMode": "code",
                "expr": "sum(kube_pod_container_resource_requests{resource=\"memory\"})",
                "hide": false,
                "legendFormat": "Requests",
                "range": true,
                "refId": "B"
              },
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "$${datasource}"
                },
                "editorMode": "code",
                "expr": "sum(kube_pod_container_resource_limits{resource=\"memory\"})",
                "hide": false,
                "legendFormat": "Limits",
                "range": true,
                "refId": "C"
              },
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "$${datasource}"
                },
                "editorMode": "code",
                "expr": "sum(machine_memory_bytes)",
                "hide": false,
                "legendFormat": "Total",
                "range": true,
                "refId": "D"
              }
            ],
            "title": "RAM Usage",
            "type": "stat"
          },
          {
            "datasource": {
              "type": "prometheus",
              "uid": "$${datasource}"
            },
            "fieldConfig": {
              "defaults": {
                "mappings": [],
                "noValue": "0",
                "thresholds": {
                  "mode": "absolute",
                  "steps": [
                    {
                      "color": "blue",
                      "value": null
                    }
                  ]
                }
              },
              "overrides": []
            },
            "gridPos": {
              "h": 4,
              "w": 2,
              "x": 12,
              "y": 9
            },
            "id": 62,
            "options": {
              "colorMode": "value",
              "graphMode": "none",
              "justifyMode": "auto",
              "orientation": "auto",
              "reduceOptions": {
                "calcs": [
                  "last"
                ],
                "fields": "",
                "values": false
              },
              "text": {},
              "textMode": "value"
            },
            "pluginVersion": "10.0.3",
            "targets": [
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "$${datasource}"
                },
                "expr": "sum(kube_pod_status_phase{phase=\"Running\"})",
                "interval": "",
                "legendFormat": "",
                "refId": "A"
              }
            ],
            "title": "Running Pods",
            "type": "stat"
          },
          {
            "collapsed": false,
            "datasource": {
              "type": "prometheus",
              "uid": "prometheus"
            },
            "gridPos": {
              "h": 1,
              "w": 24,
              "x": 0,
              "y": 13
            },
            "id": 71,
            "panels": [],
            "title": "Resources",
            "type": "row"
          },
          {
            "datasource": {
              "type": "prometheus",
              "uid": "$${datasource}"
            },
            "fieldConfig": {
              "defaults": {
                "color": {
                  "mode": "continuous-GrYlRd",
                  "seriesBy": "last"
                },
                "custom": {
                  "axisCenteredZero": false,
                  "axisColorMode": "text",
                  "axisLabel": "CPU %",
                  "axisPlacement": "auto",
                  "barAlignment": 0,
                  "drawStyle": "line",
                  "fillOpacity": 10,
                  "gradientMode": "scheme",
                  "hideFrom": {
                    "legend": false,
                    "tooltip": false,
                    "viz": false
                  },
                  "lineInterpolation": "smooth",
                  "lineStyle": {
                    "fill": "solid"
                  },
                  "lineWidth": 2,
                  "pointSize": 5,
                  "scaleDistribution": {
                    "type": "linear"
                  },
                  "showPoints": "never",
                  "spanNulls": false,
                  "stacking": {
                    "group": "A",
                    "mode": "none"
                  },
                  "thresholdsStyle": {
                    "mode": "off"
                  }
                },
                "decimals": 2,
                "mappings": [],
                "thresholds": {
                  "mode": "absolute",
                  "steps": [
                    {
                      "color": "green",
                      "value": null
                    },
                    {
                      "color": "yellow",
                      "value": 0.5
                    },
                    {
                      "color": "red",
                      "value": 0.7
                    }
                  ]
                },
                "unit": "percentunit"
              },
              "overrides": []
            },
            "gridPos": {
              "h": 8,
              "w": 12,
              "x": 0,
              "y": 14
            },
            "id": 72,
            "options": {
              "legend": {
                "calcs": [],
                "displayMode": "hidden",
                "placement": "right",
                "showLegend": false
              },
              "tooltip": {
                "mode": "single",
                "sort": "none"
              }
            },
            "pluginVersion": "8.3.3",
            "targets": [
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "$${datasource}"
                },
                "exemplar": true,
                "expr": "avg(1-rate(node_cpu_seconds_total{mode=\"idle\"}[$__rate_interval]))",
                "interval": "$resolution",
                "legendFormat": "CPU usage in %",
                "refId": "A"
              }
            ],
            "title": "Cluster CPU Utilization",
            "type": "timeseries"
          },
          {
            "datasource": {
              "type": "prometheus",
              "uid": "$${datasource}"
            },
            "fieldConfig": {
              "defaults": {
                "color": {
                  "mode": "continuous-GrYlRd"
                },
                "custom": {
                  "axisCenteredZero": false,
                  "axisColorMode": "text",
                  "axisLabel": "MEMORY",
                  "axisPlacement": "auto",
                  "barAlignment": 0,
                  "drawStyle": "line",
                  "fillOpacity": 10,
                  "gradientMode": "scheme",
                  "hideFrom": {
                    "legend": false,
                    "tooltip": false,
                    "viz": false
                  },
                  "lineInterpolation": "smooth",
                  "lineWidth": 2,
                  "pointSize": 5,
                  "scaleDistribution": {
                    "type": "linear"
                  },
                  "showPoints": "never",
                  "spanNulls": false,
                  "stacking": {
                    "group": "A",
                    "mode": "none"
                  },
                  "thresholdsStyle": {
                    "mode": "off"
                  }
                },
                "mappings": [],
                "thresholds": {
                  "mode": "absolute",
                  "steps": [
                    {
                      "color": "green",
                      "value": null
                    },
                    {
                      "color": "#EAB839",
                      "value": 0.5
                    },
                    {
                      "color": "red",
                      "value": 0.7
                    }
                  ]
                },
                "unit": "percentunit"
              },
              "overrides": []
            },
            "gridPos": {
              "h": 8,
              "w": 12,
              "x": 12,
              "y": 14
            },
            "id": 55,
            "options": {
              "legend": {
                "calcs": [
                  "mean",
                  "lastNotNull",
                  "max",
                  "min"
                ],
                "displayMode": "hidden",
                "placement": "right",
                "showLegend": false
              },
              "tooltip": {
                "mode": "single",
                "sort": "none"
              }
            },
            "pluginVersion": "8.3.3",
            "targets": [
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "$${datasource}"
                },
                "editorMode": "code",
                "exemplar": true,
                "expr": "sum(node_memory_MemTotal_bytes - node_memory_MemAvailable_bytes) / sum(node_memory_MemTotal_bytes)",
                "interval": "$resolution",
                "legendFormat": "Memory usage in %",
                "range": true,
                "refId": "A"
              }
            ],
            "title": "Cluster Memory Utilization",
            "type": "timeseries"
          },
          {
            "datasource": {
              "type": "prometheus",
              "uid": "$${datasource}"
            },
            "fieldConfig": {
              "defaults": {
                "color": {
                  "mode": "palette-classic"
                },
                "custom": {
                  "axisCenteredZero": false,
                  "axisColorMode": "text",
                  "axisLabel": "CPU CORES",
                  "axisPlacement": "auto",
                  "barAlignment": 0,
                  "drawStyle": "line",
                  "fillOpacity": 25,
                  "gradientMode": "opacity",
                  "hideFrom": {
                    "legend": false,
                    "tooltip": false,
                    "viz": false
                  },
                  "lineInterpolation": "smooth",
                  "lineStyle": {
                    "fill": "solid"
                  },
                  "lineWidth": 2,
                  "pointSize": 5,
                  "scaleDistribution": {
                    "type": "linear"
                  },
                  "showPoints": "never",
                  "spanNulls": false,
                  "stacking": {
                    "group": "A",
                    "mode": "none"
                  },
                  "thresholdsStyle": {
                    "mode": "off"
                  }
                },
                "decimals": 2,
                "mappings": [],
                "thresholds": {
                  "mode": "absolute",
                  "steps": [
                    {
                      "color": "green",
                      "value": null
                    },
                    {
                      "color": "red",
                      "value": 80
                    }
                  ]
                },
                "unit": "none"
              },
              "overrides": []
            },
            "gridPos": {
              "h": 8,
              "w": 12,
              "x": 0,
              "y": 22
            },
            "id": 46,
            "options": {
              "legend": {
                "calcs": [
                  "min",
                  "max",
                  "mean"
                ],
                "displayMode": "table",
                "placement": "right",
                "showLegend": true,
                "sortBy": "Max",
                "sortDesc": true
              },
              "tooltip": {
                "mode": "single",
                "sort": "none"
              }
            },
            "pluginVersion": "8.3.3",
            "targets": [
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "$${datasource}"
                },
                "exemplar": true,
                "expr": "sum(rate(container_cpu_usage_seconds_total{image!=\"\"}[$__rate_interval])) by (namespace)",
                "interval": "$resolution",
                "legendFormat": "{{ namespace }}",
                "refId": "A"
              }
            ],
            "title": "CPU Utilization by namespace",
            "type": "timeseries"
          },
          {
            "datasource": {
              "type": "prometheus",
              "uid": "$${datasource}"
            },
            "fieldConfig": {
              "defaults": {
                "color": {
                  "mode": "palette-classic"
                },
                "custom": {
                  "axisCenteredZero": false,
                  "axisColorMode": "text",
                  "axisLabel": "",
                  "axisPlacement": "auto",
                  "barAlignment": 0,
                  "drawStyle": "line",
                  "fillOpacity": 25,
                  "gradientMode": "opacity",
                  "hideFrom": {
                    "legend": false,
                    "tooltip": false,
                    "viz": false
                  },
                  "lineInterpolation": "smooth",
                  "lineWidth": 2,
                  "pointSize": 5,
                  "scaleDistribution": {
                    "type": "linear"
                  },
                  "showPoints": "never",
                  "spanNulls": false,
                  "stacking": {
                    "group": "A",
                    "mode": "none"
                  },
                  "thresholdsStyle": {
                    "mode": "off"
                  }
                },
                "mappings": [],
                "thresholds": {
                  "mode": "absolute",
                  "steps": [
                    {
                      "color": "green",
                      "value": null
                    },
                    {
                      "color": "red",
                      "value": 80
                    }
                  ]
                },
                "unit": "bytes"
              },
              "overrides": []
            },
            "gridPos": {
              "h": 8,
              "w": 12,
              "x": 12,
              "y": 22
            },
            "id": 50,
            "options": {
              "legend": {
                "calcs": [
                  "min",
                  "max",
                  "mean"
                ],
                "displayMode": "table",
                "placement": "right",
                "showLegend": true,
                "sortBy": "Max",
                "sortDesc": true
              },
              "tooltip": {
                "mode": "single",
                "sort": "none"
              }
            },
            "pluginVersion": "8.3.3",
            "targets": [
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "$${datasource}"
                },
                "exemplar": true,
                "expr": "sum(container_memory_working_set_bytes{image!=\"\"}) by (namespace)",
                "interval": "$resolution",
                "legendFormat": "{{ namespace }}",
                "refId": "A"
              }
            ],
            "title": "Memory Utilization by namespace",
            "type": "timeseries"
          },
          {
            "datasource": {
              "type": "prometheus",
              "uid": "$${datasource}"
            },
            "fieldConfig": {
              "defaults": {
                "color": {
                  "mode": "palette-classic"
                },
                "custom": {
                  "axisCenteredZero": false,
                  "axisColorMode": "text",
                  "axisLabel": "CPU %",
                  "axisPlacement": "auto",
                  "barAlignment": 0,
                  "drawStyle": "line",
                  "fillOpacity": 25,
                  "gradientMode": "opacity",
                  "hideFrom": {
                    "legend": false,
                    "tooltip": false,
                    "viz": false
                  },
                  "lineInterpolation": "smooth",
                  "lineWidth": 2,
                  "pointSize": 5,
                  "scaleDistribution": {
                    "type": "linear"
                  },
                  "showPoints": "never",
                  "spanNulls": false,
                  "stacking": {
                    "group": "A",
                    "mode": "none"
                  },
                  "thresholdsStyle": {
                    "mode": "off"
                  }
                },
                "decimals": 2,
                "mappings": [],
                "thresholds": {
                  "mode": "absolute",
                  "steps": [
                    {
                      "color": "green",
                      "value": null
                    },
                    {
                      "color": "red",
                      "value": 80
                    }
                  ]
                },
                "unit": "percentunit"
              },
              "overrides": []
            },
            "gridPos": {
              "h": 8,
              "w": 12,
              "x": 0,
              "y": 30
            },
            "id": 54,
            "options": {
              "legend": {
                "calcs": [
                  "min",
                  "max",
                  "mean"
                ],
                "displayMode": "table",
                "placement": "right",
                "showLegend": true,
                "sortBy": "Max",
                "sortDesc": true
              },
              "tooltip": {
                "mode": "single",
                "sort": "none"
              }
            },
            "pluginVersion": "8.3.3",
            "targets": [
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "$${datasource}"
                },
                "exemplar": true,
                "expr": "avg(1-rate(node_cpu_seconds_total{mode=\"idle\"}[$__rate_interval])) by (instance)",
                "interval": "$resolution",
                "legendFormat": "{{ node }}",
                "refId": "A"
              }
            ],
            "title": "CPU Utilization by instance",
            "type": "timeseries"
          },
          {
            "datasource": {
              "type": "prometheus",
              "uid": "$${datasource}"
            },
            "fieldConfig": {
              "defaults": {
                "color": {
                  "mode": "palette-classic"
                },
                "custom": {
                  "axisCenteredZero": false,
                  "axisColorMode": "text",
                  "axisLabel": "MEMORY",
                  "axisPlacement": "auto",
                  "barAlignment": 0,
                  "drawStyle": "line",
                  "fillOpacity": 25,
                  "gradientMode": "opacity",
                  "hideFrom": {
                    "legend": false,
                    "tooltip": false,
                    "viz": false
                  },
                  "lineInterpolation": "smooth",
                  "lineWidth": 2,
                  "pointSize": 5,
                  "scaleDistribution": {
                    "type": "linear"
                  },
                  "showPoints": "never",
                  "spanNulls": false,
                  "stacking": {
                    "group": "A",
                    "mode": "none"
                  },
                  "thresholdsStyle": {
                    "mode": "off"
                  }
                },
                "mappings": [],
                "thresholds": {
                  "mode": "absolute",
                  "steps": [
                    {
                      "color": "green",
                      "value": null
                    },
                    {
                      "color": "red",
                      "value": 80
                    }
                  ]
                },
                "unit": "bytes"
              },
              "overrides": []
            },
            "gridPos": {
              "h": 8,
              "w": 12,
              "x": 12,
              "y": 30
            },
            "id": 73,
            "options": {
              "legend": {
                "calcs": [
                  "min",
                  "max",
                  "mean"
                ],
                "displayMode": "table",
                "placement": "right",
                "showLegend": true,
                "sortBy": "Max",
                "sortDesc": true
              },
              "tooltip": {
                "mode": "single",
                "sort": "none"
              }
            },
            "pluginVersion": "8.3.3",
            "targets": [
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "$${datasource}"
                },
                "editorMode": "code",
                "exemplar": true,
                "expr": "sum(node_memory_MemTotal_bytes - node_memory_MemAvailable_bytes) by (instance)",
                "interval": "$resolution",
                "legendFormat": "{{ node}}",
                "range": true,
                "refId": "A"
              }
            ],
            "title": "Memory Utilization by instance",
            "type": "timeseries"
          },
          {
            "datasource": {
              "type": "prometheus",
              "uid": "$${datasource}"
            },
            "description": "No data is generally a good thing here.",
            "fieldConfig": {
              "defaults": {
                "color": {
                  "mode": "palette-classic"
                },
                "custom": {
                  "axisCenteredZero": false,
                  "axisColorMode": "text",
                  "axisLabel": "SECONDS",
                  "axisPlacement": "auto",
                  "barAlignment": 0,
                  "drawStyle": "line",
                  "fillOpacity": 25,
                  "gradientMode": "opacity",
                  "hideFrom": {
                    "legend": false,
                    "tooltip": false,
                    "viz": false
                  },
                  "lineInterpolation": "smooth",
                  "lineStyle": {
                    "fill": "solid"
                  },
                  "lineWidth": 2,
                  "pointSize": 5,
                  "scaleDistribution": {
                    "type": "linear"
                  },
                  "showPoints": "never",
                  "spanNulls": false,
                  "stacking": {
                    "group": "A",
                    "mode": "none"
                  },
                  "thresholdsStyle": {
                    "mode": "off"
                  }
                },
                "decimals": 2,
                "mappings": [],
                "thresholds": {
                  "mode": "absolute",
                  "steps": [
                    {
                      "color": "green",
                      "value": null
                    },
                    {
                      "color": "red",
                      "value": 80
                    }
                  ]
                },
                "unit": "s"
              },
              "overrides": []
            },
            "gridPos": {
              "h": 8,
              "w": 12,
              "x": 0,
              "y": 38
            },
            "id": 82,
            "options": {
              "legend": {
                "calcs": [
                  "min",
                  "max",
                  "mean"
                ],
                "displayMode": "table",
                "placement": "right",
                "showLegend": true,
                "sortBy": "Max",
                "sortDesc": true
              },
              "tooltip": {
                "mode": "multi",
                "sort": "none"
              }
            },
            "pluginVersion": "8.3.3",
            "targets": [
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "$${datasource}"
                },
                "editorMode": "code",
                "exemplar": true,
                "expr": "sum(rate(container_cpu_cfs_throttled_seconds_total{image!=\"\"}[$__rate_interval])) by (namespace) > 0",
                "interval": "$resolution",
                "legendFormat": "{{ namespace }}",
                "range": true,
                "refId": "A"
              }
            ],
            "title": "CPU Throttled seconds by namespace",
            "type": "timeseries"
          },
          {
            "datasource": {
              "type": "prometheus",
              "uid": "$${datasource}"
            },
            "description": "No data is generally a good thing here.",
            "fieldConfig": {
              "defaults": {
                "color": {
                  "mode": "palette-classic"
                },
                "custom": {
                  "axisCenteredZero": false,
                  "axisColorMode": "text",
                  "axisLabel": "NB",
                  "axisPlacement": "auto",
                  "barAlignment": 0,
                  "drawStyle": "line",
                  "fillOpacity": 25,
                  "gradientMode": "opacity",
                  "hideFrom": {
                    "legend": false,
                    "tooltip": false,
                    "viz": false
                  },
                  "lineInterpolation": "smooth",
                  "lineStyle": {
                    "fill": "solid"
                  },
                  "lineWidth": 2,
                  "pointSize": 5,
                  "scaleDistribution": {
                    "type": "linear"
                  },
                  "showPoints": "never",
                  "spanNulls": false,
                  "stacking": {
                    "group": "A",
                    "mode": "none"
                  },
                  "thresholdsStyle": {
                    "mode": "off"
                  }
                },
                "decimals": 2,
                "mappings": [],
                "thresholds": {
                  "mode": "absolute",
                  "steps": [
                    {
                      "color": "green",
                      "value": null
                    },
                    {
                      "color": "red",
                      "value": 80
                    }
                  ]
                },
                "unit": "none"
              },
              "overrides": []
            },
            "gridPos": {
              "h": 8,
              "w": 12,
              "x": 12,
              "y": 38
            },
            "id": 83,
            "options": {
              "legend": {
                "calcs": [
                  "min",
                  "max",
                  "mean"
                ],
                "displayMode": "table",
                "placement": "right",
                "showLegend": true,
                "sortBy": "Max",
                "sortDesc": true
              },
              "tooltip": {
                "mode": "multi",
                "sort": "none"
              }
            },
            "pluginVersion": "8.3.3",
            "targets": [
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "$${datasource}"
                },
                "editorMode": "code",
                "exemplar": true,
                "expr": "sum(rate(node_cpu_core_throttles_total[$__rate_interval])) by (instance)",
                "interval": "$resolution",
                "legendFormat": "{{ instance }}",
                "range": true,
                "refId": "A"
              }
            ],
            "title": "CPU Core Throttled by instance",
            "type": "timeseries"
          },
          {
            "collapsed": false,
            "gridPos": {
              "h": 1,
              "w": 24,
              "x": 0,
              "y": 46
            },
            "id": 86,
            "panels": [],
            "title": "Kubernetes",
            "type": "row"
          },
          {
            "datasource": {
              "type": "prometheus",
              "uid": "$${datasource}"
            },
            "fieldConfig": {
              "defaults": {
                "color": {
                  "mode": "palette-classic"
                },
                "custom": {
                  "axisCenteredZero": false,
                  "axisColorMode": "text",
                  "axisLabel": "",
                  "axisPlacement": "auto",
                  "barAlignment": 0,
                  "drawStyle": "line",
                  "fillOpacity": 25,
                  "gradientMode": "opacity",
                  "hideFrom": {
                    "legend": false,
                    "tooltip": false,
                    "viz": false
                  },
                  "lineInterpolation": "smooth",
                  "lineWidth": 2,
                  "pointSize": 5,
                  "scaleDistribution": {
                    "type": "linear"
                  },
                  "showPoints": "never",
                  "spanNulls": false,
                  "stacking": {
                    "group": "A",
                    "mode": "none"
                  },
                  "thresholdsStyle": {
                    "mode": "off"
                  }
                },
                "mappings": [],
                "thresholds": {
                  "mode": "absolute",
                  "steps": [
                    {
                      "color": "green",
                      "value": null
                    },
                    {
                      "color": "red",
                      "value": 80
                    }
                  ]
                },
                "unit": "short"
              },
              "overrides": []
            },
            "gridPos": {
              "h": 9,
              "w": 12,
              "x": 0,
              "y": 47
            },
            "id": 84,
            "options": {
              "legend": {
                "calcs": [
                  "min",
                  "max",
                  "mean"
                ],
                "displayMode": "table",
                "placement": "right",
                "showLegend": true,
                "sortBy": "Max",
                "sortDesc": true
              },
              "tooltip": {
                "mode": "multi",
                "sort": "none"
              }
            },
            "pluginVersion": "8.3.3",
            "targets": [
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "$${datasource}"
                },
                "editorMode": "code",
                "exemplar": true,
                "expr": "sum(kube_pod_status_qos_class) by (qos_class)",
                "interval": "",
                "legendFormat": "{{ qos_class }} pods",
                "range": true,
                "refId": "A"
              },
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "$${datasource}"
                },
                "editorMode": "code",
                "expr": "sum(kube_pod_info)",
                "hide": false,
                "legendFormat": "Total pods",
                "range": true,
                "refId": "B"
              }
            ],
            "title": "Kubernetes Pods QoS classes",
            "type": "timeseries"
          },
          {
            "datasource": {
              "type": "prometheus",
              "uid": "$${datasource}"
            },
            "fieldConfig": {
              "defaults": {
                "color": {
                  "mode": "palette-classic"
                },
                "custom": {
                  "axisCenteredZero": false,
                  "axisColorMode": "text",
                  "axisLabel": "",
                  "axisPlacement": "auto",
                  "barAlignment": 0,
                  "drawStyle": "line",
                  "fillOpacity": 25,
                  "gradientMode": "opacity",
                  "hideFrom": {
                    "legend": false,
                    "tooltip": false,
                    "viz": false
                  },
                  "lineInterpolation": "smooth",
                  "lineWidth": 2,
                  "pointSize": 5,
                  "scaleDistribution": {
                    "type": "linear"
                  },
                  "showPoints": "never",
                  "spanNulls": false,
                  "stacking": {
                    "group": "A",
                    "mode": "none"
                  },
                  "thresholdsStyle": {
                    "mode": "off"
                  }
                },
                "mappings": [],
                "thresholds": {
                  "mode": "absolute",
                  "steps": [
                    {
                      "color": "green",
                      "value": null
                    },
                    {
                      "color": "red",
                      "value": 80
                    }
                  ]
                },
                "unit": "short"
              },
              "overrides": []
            },
            "gridPos": {
              "h": 9,
              "w": 12,
              "x": 12,
              "y": 47
            },
            "id": 85,
            "options": {
              "legend": {
                "calcs": [
                  "min",
                  "max",
                  "mean"
                ],
                "displayMode": "table",
                "placement": "right",
                "showLegend": true,
                "sortBy": "Max",
                "sortDesc": true
              },
              "tooltip": {
                "mode": "multi",
                "sort": "none"
              }
            },
            "pluginVersion": "8.3.3",
            "targets": [
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "$${datasource}"
                },
                "editorMode": "code",
                "exemplar": true,
                "expr": "sum(kube_pod_status_reason) by (reason)",
                "interval": "",
                "legendFormat": "{{ reason }}",
                "range": true,
                "refId": "A"
              }
            ],
            "title": "Kubernetes Pods Status Reason",
            "type": "timeseries"
          },
          {
            "datasource": {
              "type": "prometheus",
              "uid": "$${datasource}"
            },
            "description": "No data is generally a good thing here.",
            "fieldConfig": {
              "defaults": {
                "color": {
                  "mode": "palette-classic"
                },
                "custom": {
                  "axisCenteredZero": false,
                  "axisColorMode": "text",
                  "axisLabel": "",
                  "axisPlacement": "auto",
                  "barAlignment": 0,
                  "drawStyle": "points",
                  "fillOpacity": 25,
                  "gradientMode": "opacity",
                  "hideFrom": {
                    "legend": false,
                    "tooltip": false,
                    "viz": false
                  },
                  "lineInterpolation": "smooth",
                  "lineWidth": 2,
                  "pointSize": 5,
                  "scaleDistribution": {
                    "type": "linear"
                  },
                  "showPoints": "never",
                  "spanNulls": false,
                  "stacking": {
                    "group": "A",
                    "mode": "none"
                  },
                  "thresholdsStyle": {
                    "mode": "off"
                  }
                },
                "mappings": [],
                "thresholds": {
                  "mode": "absolute",
                  "steps": [
                    {
                      "color": "green",
                      "value": null
                    },
                    {
                      "color": "red",
                      "value": 80
                    }
                  ]
                },
                "unit": "short"
              },
              "overrides": []
            },
            "gridPos": {
              "h": 9,
              "w": 12,
              "x": 0,
              "y": 56
            },
            "id": 87,
            "options": {
              "legend": {
                "calcs": [
                  "min",
                  "max",
                  "mean"
                ],
                "displayMode": "table",
                "placement": "right",
                "showLegend": true,
                "sortBy": "Max",
                "sortDesc": true
              },
              "tooltip": {
                "mode": "multi",
                "sort": "none"
              }
            },
            "pluginVersion": "8.3.3",
            "targets": [
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "$${datasource}"
                },
                "editorMode": "code",
                "exemplar": true,
                "expr": "sum(increase(container_oom_events_total[$__rate_interval])) by (namespace) > 0",
                "interval": "",
                "legendFormat": "{{ namespace }}",
                "range": true,
                "refId": "A"
              }
            ],
            "title": "OOM Events by namespace",
            "type": "timeseries"
          },
          {
            "datasource": {
              "type": "prometheus",
              "uid": "$${datasource}"
            },
            "description": "No data is generally a good thing here.",
            "fieldConfig": {
              "defaults": {
                "color": {
                  "mode": "palette-classic"
                },
                "custom": {
                  "axisCenteredZero": false,
                  "axisColorMode": "text",
                  "axisLabel": "",
                  "axisPlacement": "auto",
                  "barAlignment": 0,
                  "drawStyle": "points",
                  "fillOpacity": 25,
                  "gradientMode": "opacity",
                  "hideFrom": {
                    "legend": false,
                    "tooltip": false,
                    "viz": false
                  },
                  "lineInterpolation": "smooth",
                  "lineWidth": 2,
                  "pointSize": 5,
                  "scaleDistribution": {
                    "type": "linear"
                  },
                  "showPoints": "never",
                  "spanNulls": false,
                  "stacking": {
                    "group": "A",
                    "mode": "none"
                  },
                  "thresholdsStyle": {
                    "mode": "off"
                  }
                },
                "mappings": [],
                "thresholds": {
                  "mode": "absolute",
                  "steps": [
                    {
                      "color": "green",
                      "value": null
                    },
                    {
                      "color": "red",
                      "value": 80
                    }
                  ]
                },
                "unit": "short"
              },
              "overrides": []
            },
            "gridPos": {
              "h": 9,
              "w": 12,
              "x": 12,
              "y": 56
            },
            "id": 88,
            "options": {
              "legend": {
                "calcs": [
                  "min",
                  "max",
                  "mean"
                ],
                "displayMode": "table",
                "placement": "right",
                "showLegend": true,
                "sortBy": "Max",
                "sortDesc": true
              },
              "tooltip": {
                "mode": "multi",
                "sort": "none"
              }
            },
            "pluginVersion": "8.3.3",
            "targets": [
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "$${datasource}"
                },
                "editorMode": "code",
                "exemplar": true,
                "expr": "sum(increase(kube_pod_container_status_restarts_total[$__rate_interval])) by (namespace) > 0",
                "interval": "",
                "legendFormat": "{{ namespace }}",
                "range": true,
                "refId": "A"
              }
            ],
            "title": "Container Restarts by namespace",
            "type": "timeseries"
          },
          {
            "collapsed": false,
            "datasource": {
              "type": "prometheus",
              "uid": "prometheus"
            },
            "gridPos": {
              "h": 1,
              "w": 24,
              "x": 0,
              "y": 65
            },
            "id": 69,
            "panels": [],
            "title": "Network",
            "type": "row"
          },
          {
            "datasource": {
              "type": "prometheus",
              "uid": "$${datasource}"
            },
            "description": "Dropped noisy virtual devices for readability.",
            "fieldConfig": {
              "defaults": {
                "color": {
                  "mode": "palette-classic"
                },
                "custom": {
                  "axisCenteredZero": false,
                  "axisColorMode": "text",
                  "axisLabel": "BANDWIDTH",
                  "axisPlacement": "auto",
                  "barAlignment": 0,
                  "drawStyle": "line",
                  "fillOpacity": 25,
                  "gradientMode": "opacity",
                  "hideFrom": {
                    "legend": false,
                    "tooltip": false,
                    "viz": false
                  },
                  "lineInterpolation": "smooth",
                  "lineWidth": 2,
                  "pointSize": 5,
                  "scaleDistribution": {
                    "type": "linear"
                  },
                  "showPoints": "never",
                  "spanNulls": false,
                  "stacking": {
                    "group": "A",
                    "mode": "none"
                  },
                  "thresholdsStyle": {
                    "mode": "off"
                  }
                },
                "mappings": [],
                "thresholds": {
                  "mode": "absolute",
                  "steps": [
                    {
                      "color": "green",
                      "value": null
                    },
                    {
                      "color": "red",
                      "value": 80
                    }
                  ]
                },
                "unit": "bytes"
              },
              "overrides": []
            },
            "gridPos": {
              "h": 8,
              "w": 12,
              "x": 0,
              "y": 66
            },
            "id": 44,
            "options": {
              "legend": {
                "calcs": [],
                "displayMode": "hidden",
                "placement": "bottom",
                "showLegend": false
              },
              "tooltip": {
                "mode": "multi",
                "sort": "none"
              }
            },
            "pluginVersion": "8.3.3",
            "targets": [
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "$${datasource}"
                },
                "editorMode": "code",
                "exemplar": true,
                "expr": "sum(rate(node_network_receive_bytes_total{device!~\"lxc.*|veth.*\"}[$__rate_interval])) by (device)",
                "interval": "$resolution",
                "legendFormat": "Received : {{ device }}",
                "range": true,
                "refId": "A"
              },
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "$${datasource}"
                },
                "editorMode": "code",
                "exemplar": true,
                "expr": "- sum(rate(node_network_transmit_bytes_total{device!~\"lxc.*|veth.*\"}[$__rate_interval]))  by (device)",
                "interval": "$resolution",
                "legendFormat": "Transmitted : {{ device }}",
                "range": true,
                "refId": "B"
              }
            ],
            "title": "Global Network Utilization by device",
            "type": "timeseries"
          },
          {
            "datasource": {
              "type": "prometheus",
              "uid": "$${datasource}"
            },
            "fieldConfig": {
              "defaults": {
                "color": {
                  "mode": "palette-classic"
                },
                "custom": {
                  "axisCenteredZero": false,
                  "axisColorMode": "text",
                  "axisLabel": "DROPPED PACKETS",
                  "axisPlacement": "auto",
                  "barAlignment": 0,
                  "drawStyle": "line",
                  "fillOpacity": 25,
                  "gradientMode": "opacity",
                  "hideFrom": {
                    "legend": false,
                    "tooltip": false,
                    "viz": false
                  },
                  "lineInterpolation": "smooth",
                  "lineWidth": 2,
                  "pointSize": 5,
                  "scaleDistribution": {
                    "type": "linear"
                  },
                  "showPoints": "never",
                  "spanNulls": false,
                  "stacking": {
                    "group": "A",
                    "mode": "none"
                  },
                  "thresholdsStyle": {
                    "mode": "off"
                  }
                },
                "mappings": [],
                "thresholds": {
                  "mode": "absolute",
                  "steps": [
                    {
                      "color": "green",
                      "value": null
                    },
                    {
                      "color": "red",
                      "value": 80
                    }
                  ]
                },
                "unit": "none"
              },
              "overrides": []
            },
            "gridPos": {
              "h": 8,
              "w": 12,
              "x": 12,
              "y": 66
            },
            "id": 53,
            "options": {
              "legend": {
                "calcs": [],
                "displayMode": "hidden",
                "placement": "bottom",
                "showLegend": false
              },
              "tooltip": {
                "mode": "multi",
                "sort": "none"
              }
            },
            "pluginVersion": "8.3.3",
            "targets": [
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "$${datasource}"
                },
                "editorMode": "code",
                "exemplar": true,
                "expr": "sum(rate(node_network_receive_drop_total[$__rate_interval]))",
                "interval": "$resolution",
                "legendFormat": "Packets dropped (receive)",
                "range": true,
                "refId": "A"
              },
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "$${datasource}"
                },
                "editorMode": "code",
                "exemplar": true,
                "expr": "- sum(rate(node_network_transmit_drop_total[$__rate_interval]))",
                "interval": "$resolution",
                "legendFormat": "Packets dropped (transmit)",
                "range": true,
                "refId": "B"
              }
            ],
            "title": "Network Saturation - Packets dropped",
            "type": "timeseries"
          },
          {
            "datasource": {
              "type": "prometheus",
              "uid": "$${datasource}"
            },
            "fieldConfig": {
              "defaults": {
                "color": {
                  "mode": "palette-classic"
                },
                "custom": {
                  "axisCenteredZero": false,
                  "axisColorMode": "text",
                  "axisLabel": "BANDWIDTH",
                  "axisPlacement": "auto",
                  "barAlignment": 0,
                  "drawStyle": "line",
                  "fillOpacity": 25,
                  "gradientMode": "opacity",
                  "hideFrom": {
                    "legend": false,
                    "tooltip": false,
                    "viz": false
                  },
                  "lineInterpolation": "smooth",
                  "lineWidth": 2,
                  "pointSize": 5,
                  "scaleDistribution": {
                    "type": "linear"
                  },
                  "showPoints": "never",
                  "spanNulls": false,
                  "stacking": {
                    "group": "A",
                    "mode": "none"
                  },
                  "thresholdsStyle": {
                    "mode": "off"
                  }
                },
                "mappings": [],
                "thresholds": {
                  "mode": "absolute",
                  "steps": [
                    {
                      "color": "green",
                      "value": null
                    },
                    {
                      "color": "red",
                      "value": 80
                    }
                  ]
                },
                "unit": "bytes"
              },
              "overrides": []
            },
            "gridPos": {
              "h": 8,
              "w": 12,
              "x": 0,
              "y": 74
            },
            "id": 79,
            "options": {
              "legend": {
                "calcs": [],
                "displayMode": "hidden",
                "placement": "bottom",
                "showLegend": false
              },
              "tooltip": {
                "mode": "multi",
                "sort": "desc"
              }
            },
            "pluginVersion": "8.3.3",
            "targets": [
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "$${datasource}"
                },
                "editorMode": "code",
                "exemplar": true,
                "expr": "sum(rate(container_network_receive_bytes_total[$__rate_interval])) by (namespace)",
                "interval": "$resolution",
                "legendFormat": "Received : {{ namespace }}",
                "range": true,
                "refId": "A"
              },
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "$${datasource}"
                },
                "editorMode": "code",
                "expr": "- sum(rate(container_network_transmit_bytes_total[$__rate_interval])) by (namespace)",
                "hide": false,
                "interval": "$resolution",
                "legendFormat": "Transmitted : {{ namespace }}",
                "range": true,
                "refId": "B"
              }
            ],
            "title": "Network Received by namespace",
            "type": "timeseries"
          },
          {
            "datasource": {
              "type": "prometheus",
              "uid": "$${datasource}"
            },
            "fieldConfig": {
              "defaults": {
                "color": {
                  "mode": "palette-classic"
                },
                "custom": {
                  "axisCenteredZero": false,
                  "axisColorMode": "text",
                  "axisLabel": "BANDWIDTH",
                  "axisPlacement": "auto",
                  "barAlignment": 0,
                  "drawStyle": "line",
                  "fillOpacity": 25,
                  "gradientMode": "opacity",
                  "hideFrom": {
                    "legend": false,
                    "tooltip": false,
                    "viz": false
                  },
                  "lineInterpolation": "smooth",
                  "lineWidth": 2,
                  "pointSize": 5,
                  "scaleDistribution": {
                    "type": "linear"
                  },
                  "showPoints": "never",
                  "spanNulls": false,
                  "stacking": {
                    "group": "A",
                    "mode": "none"
                  },
                  "thresholdsStyle": {
                    "mode": "off"
                  }
                },
                "mappings": [],
                "thresholds": {
                  "mode": "absolute",
                  "steps": [
                    {
                      "color": "green",
                      "value": null
                    },
                    {
                      "color": "red",
                      "value": 80
                    }
                  ]
                },
                "unit": "bytes"
              },
              "overrides": []
            },
            "gridPos": {
              "h": 8,
              "w": 12,
              "x": 12,
              "y": 74
            },
            "id": 80,
            "options": {
              "legend": {
                "calcs": [],
                "displayMode": "hidden",
                "placement": "bottom",
                "showLegend": false
              },
              "tooltip": {
                "mode": "multi",
                "sort": "desc"
              }
            },
            "pluginVersion": "8.3.3",
            "targets": [
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "$${datasource}"
                },
                "editorMode": "code",
                "exemplar": true,
                "expr": "sum(rate(node_network_receive_bytes_total[$__rate_interval])) by (instance)",
                "interval": "$resolution",
                "legendFormat": "Received bytes in {{ instance }}",
                "range": true,
                "refId": "A"
              },
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "$${datasource}"
                },
                "editorMode": "code",
                "expr": "- sum(rate(node_network_transmit_bytes_total[$__rate_interval])) by (instance)",
                "hide": false,
                "interval": "$resolution",
                "legendFormat": "Transmitted bytes in {{ instance }}",
                "range": true,
                "refId": "B"
              }
            ],
            "title": "Total Network Received (with all virtual devices) by instance",
            "type": "timeseries"
          },
          {
            "datasource": {
              "type": "prometheus",
              "uid": "$${datasource}"
            },
            "description": "Dropped noisy virtual devices for readability.",
            "fieldConfig": {
              "defaults": {
                "color": {
                  "mode": "palette-classic"
                },
                "custom": {
                  "axisCenteredZero": false,
                  "axisColorMode": "text",
                  "axisLabel": "BANDWIDTH",
                  "axisPlacement": "auto",
                  "barAlignment": 0,
                  "drawStyle": "line",
                  "fillOpacity": 25,
                  "gradientMode": "opacity",
                  "hideFrom": {
                    "legend": false,
                    "tooltip": false,
                    "viz": false
                  },
                  "lineInterpolation": "smooth",
                  "lineWidth": 2,
                  "pointSize": 5,
                  "scaleDistribution": {
                    "type": "linear"
                  },
                  "showPoints": "never",
                  "spanNulls": false,
                  "stacking": {
                    "group": "A",
                    "mode": "none"
                  },
                  "thresholdsStyle": {
                    "mode": "off"
                  }
                },
                "mappings": [],
                "thresholds": {
                  "mode": "absolute",
                  "steps": [
                    {
                      "color": "green",
                      "value": null
                    },
                    {
                      "color": "red",
                      "value": 80
                    }
                  ]
                },
                "unit": "bytes"
              },
              "overrides": []
            },
            "gridPos": {
              "h": 8,
              "w": 12,
              "x": 0,
              "y": 82
            },
            "id": 56,
            "options": {
              "legend": {
                "calcs": [],
                "displayMode": "hidden",
                "placement": "bottom",
                "showLegend": false
              },
              "tooltip": {
                "mode": "multi",
                "sort": "desc"
              }
            },
            "pluginVersion": "8.3.3",
            "targets": [
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "$${datasource}"
                },
                "editorMode": "code",
                "exemplar": true,
                "expr": "sum(rate(node_network_receive_bytes_total{device!~\"lxc.*|veth.*|lo\"}[$__rate_interval])) by (instance)",
                "interval": "$resolution",
                "legendFormat": "Received bytes in {{ instance }}",
                "range": true,
                "refId": "A"
              },
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "$${datasource}"
                },
                "editorMode": "code",
                "expr": "- sum(rate(node_network_transmit_bytes_total{device!~\"lxc.*|veth.*|lo\"}[$__rate_interval])) by (instance)",
                "hide": false,
                "interval": "$resolution",
                "legendFormat": "Transmitted bytes in {{ instance }}",
                "range": true,
                "refId": "B"
              }
            ],
            "title": "Network Received (without loopback)  by instance",
            "type": "timeseries"
          },
          {
            "datasource": {
              "type": "prometheus",
              "uid": "$${datasource}"
            },
            "description": "Dropped noisy virtual devices for readability.",
            "fieldConfig": {
              "defaults": {
                "color": {
                  "mode": "palette-classic"
                },
                "custom": {
                  "axisCenteredZero": false,
                  "axisColorMode": "text",
                  "axisLabel": "BANDWIDTH",
                  "axisPlacement": "auto",
                  "barAlignment": 0,
                  "drawStyle": "line",
                  "fillOpacity": 25,
                  "gradientMode": "opacity",
                  "hideFrom": {
                    "legend": false,
                    "tooltip": false,
                    "viz": false
                  },
                  "lineInterpolation": "smooth",
                  "lineWidth": 2,
                  "pointSize": 5,
                  "scaleDistribution": {
                    "type": "linear"
                  },
                  "showPoints": "never",
                  "spanNulls": false,
                  "stacking": {
                    "group": "A",
                    "mode": "none"
                  },
                  "thresholdsStyle": {
                    "mode": "off"
                  }
                },
                "mappings": [],
                "thresholds": {
                  "mode": "absolute",
                  "steps": [
                    {
                      "color": "green",
                      "value": null
                    },
                    {
                      "color": "red",
                      "value": 80
                    }
                  ]
                },
                "unit": "bytes"
              },
              "overrides": []
            },
            "gridPos": {
              "h": 8,
              "w": 12,
              "x": 12,
              "y": 82
            },
            "id": 81,
            "options": {
              "legend": {
                "calcs": [],
                "displayMode": "hidden",
                "placement": "bottom",
                "showLegend": false
              },
              "tooltip": {
                "mode": "multi",
                "sort": "desc"
              }
            },
            "pluginVersion": "8.3.3",
            "targets": [
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "$${datasource}"
                },
                "editorMode": "code",
                "exemplar": true,
                "expr": "sum(rate(node_network_receive_bytes_total{device=\"lo\"}[$__rate_interval])) by (instance)",
                "interval": "$resolution",
                "legendFormat": "Received bytes in {{ instance }}",
                "range": true,
                "refId": "A"
              },
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "$${datasource}"
                },
                "editorMode": "code",
                "expr": "- sum(rate(node_network_transmit_bytes_total{device=\"lo\"}[$__rate_interval])) by (instance)",
                "hide": false,
                "interval": "$resolution",
                "legendFormat": "Transmitted bytes in {{ instance }}",
                "range": true,
                "refId": "B"
              }
            ],
            "title": "Network Received (loopback only) by instance",
            "type": "timeseries"
          }
        ],
        "refresh": "30s",
        "schemaVersion": 38,
        "style": "dark",
        "tags": [
          "Kubernetes",
          "Prometheus"
        ],
        "templating": {
          "list": [
            {
              "current": {
                "selected": false,
                "text": "Prometheus",
                "value": "Prometheus"
              },
              "hide": 0,
              "includeAll": false,
              "multi": false,
              "name": "datasource",
              "options": [],
              "query": "prometheus",
              "queryValue": "",
              "refresh": 1,
              "regex": "",
              "skipUrlSync": false,
              "type": "datasource"
            },
            {
              "current": {
                "selected": true,
                "text": "30s",
                "value": "30s"
              },
              "hide": 0,
              "includeAll": false,
              "multi": false,
              "name": "resolution",
              "options": [
                {
                  "selected": false,
                  "text": "1s",
                  "value": "1s"
                },
                {
                  "selected": false,
                  "text": "15s",
                  "value": "15s"
                },
                {
                  "selected": true,
                  "text": "30s",
                  "value": "30s"
                },
                {
                  "selected": false,
                  "text": "1m",
                  "value": "1m"
                },
                {
                  "selected": false,
                  "text": "3m",
                  "value": "3m"
                },
                {
                  "selected": false,
                  "text": "5m",
                  "value": "5m"
                }
              ],
              "query": "1s, 15s, 30s, 1m, 3m, 5m",
              "queryValue": "",
              "skipUrlSync": false,
              "type": "custom"
            }
          ]
        },
        "time": {
          "from": "now-1h",
          "to": "now"
        },
        "timepicker": {},
        "timezone": "",
        "title": "Kubernetes / Views / Global",
        "uid": "k8s_views_global",
        "version": 31,
        "weekStart": ""
      }
      
      EOT
    }
    "kind" = "ConfigMap"
    "metadata" = {
      "annotations" = {
        "grafana_folder" = "Kubernetes"
      }
      "labels" = {
        "grafana_dashboard" = "1"
      }
      "name"      = "dashboards-k8s-views-global"
      "namespace" = "prometheus"
    }
  }
}

resource "kubernetes_manifest" "configmap_prometheus_dashboards_k8s_views_namespaces" {
  manifest = {
    "apiVersion" = "v1"
    "data" = {
      "k8s-views-namespaces.json" = <<-EOT
      {
        "__inputs": [
          {
            "name": "DS_PROMETHEUS",
            "label": "Prometheus",
            "description": "",
            "type": "datasource",
            "pluginId": "prometheus",
            "pluginName": "Prometheus"
          }
        ],
        "__elements": [],
        "__requires": [
          {
            "type": "grafana",
            "id": "grafana",
            "name": "Grafana",
            "version": "8.3.4"
          },
          {
            "type": "datasource",
            "id": "prometheus",
            "name": "Prometheus",
            "version": "5.0.0"
          },
          {
            "type": "panel",
            "id": "timeseries",
            "name": "Time series",
            "version": ""
          },
          {
            "type": "panel",
            "id": "stat",
            "name": "Stat",
            "version": ""
          }
        ],
        "annotations": {
          "list": [
            {
              "builtIn": 1,
              "datasource": {
                "type": "datasource",
                "uid": "grafana"
              },
              "enable": true,
              "hide": true,
              "iconColor": "rgba(0, 211, 255, 1)",
              "name": "Annotations & Alerts",
              "target": {
                "limit": 100,
                "matchAny": false,
                "tags": [],
                "type": "dashboard"
              },
              "type": "dashboard"
            }
          ]
        },
        "description": "This is a modern 'Namespaces View' dashboard for your Kubernetes cluster(s). Made for kube-prometheus-stack and take advantage of the latest Grafana features. GitHub repository: https://github.com/dotdc/grafana-dashboards-kubernetes",
        "editable": true,
        "fiscalYearStartMonth": 0,
        "graphTooltip": 1,
        "links": [],
        "liveNow": false,
        "panels": [
          {
            "collapsed": false,
            "datasource": {
              "type": "datasource",
              "uid": "grafana"
            },
            "gridPos": {
              "h": 1,
              "w": 24,
              "x": 0,
              "y": 0
            },
            "id": 38,
            "panels": [],
            "title": "Overview",
            "type": "row"
          },
          {
            "datasource": {
              "type": "prometheus",
              "uid": "$${datasource}"
            },
            "fieldConfig": {
              "defaults": {
                "decimals": 2,
                "mappings": [],
                "max": 1,
                "min": 0,
                "thresholds": {
                  "mode": "percentage",
                  "steps": [
                    {
                      "color": "green",
                      "value": null
                    },
                    {
                      "color": "orange",
                      "value": 50
                    },
                    {
                      "color": "red",
                      "value": 70
                    }
                  ]
                },
                "unit": "percentunit"
              },
              "overrides": []
            },
            "gridPos": {
              "h": 7,
              "w": 6,
              "x": 0,
              "y": 1
            },
            "id": 46,
            "options": {
              "orientation": "auto",
              "reduceOptions": {
                "calcs": [
                  "mean"
                ],
                "fields": "",
                "values": false
              },
              "showThresholdLabels": false,
              "showThresholdMarkers": true,
              "text": {}
            },
            "pluginVersion": "10.0.3",
            "targets": [
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "$${datasource}"
                },
                "editorMode": "code",
                "exemplar": false,
                "expr": "sum(rate(container_cpu_usage_seconds_total{namespace=~\"$namespace\", image!=\"\"}[$__rate_interval])) / sum(machine_cpu_cores)",
                "instant": true,
                "interval": "",
                "legendFormat": "",
                "range": false,
                "refId": "A"
              }
            ],
            "title": "Namespace(s) usage on total cluster CPU in %",
            "type": "gauge"
          },
          {
            "datasource": {
              "type": "prometheus",
              "uid": "$${datasource}"
            },
            "fieldConfig": {
              "defaults": {
                "decimals": 2,
                "mappings": [],
                "max": 1,
                "min": 0,
                "thresholds": {
                  "mode": "percentage",
                  "steps": [
                    {
                      "color": "green",
                      "value": null
                    },
                    {
                      "color": "orange",
                      "value": 50
                    },
                    {
                      "color": "red",
                      "value": 70
                    }
                  ]
                },
                "unit": "percentunit"
              },
              "overrides": []
            },
            "gridPos": {
              "h": 7,
              "w": 6,
              "x": 6,
              "y": 1
            },
            "id": 48,
            "options": {
              "orientation": "auto",
              "reduceOptions": {
                "calcs": [
                  "lastNotNull"
                ],
                "fields": "",
                "values": false
              },
              "showThresholdLabels": false,
              "showThresholdMarkers": true,
              "text": {}
            },
            "pluginVersion": "10.0.3",
            "targets": [
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "$${datasource}"
                },
                "exemplar": true,
                "expr": "sum(container_memory_working_set_bytes{namespace=~\"$namespace\", image!=\"\"}) / sum(machine_memory_bytes)",
                "interval": "",
                "legendFormat": "",
                "refId": "A"
              }
            ],
            "title": "Namespace(s) usage on total cluster RAM in %",
            "type": "gauge"
          },
          {
            "datasource": {
              "type": "prometheus",
              "uid": "$${datasource}"
            },
            "fieldConfig": {
              "defaults": {
                "color": {
                  "mode": "palette-classic"
                },
                "custom": {
                  "axisCenteredZero": false,
                  "axisColorMode": "text",
                  "axisLabel": "",
                  "axisPlacement": "auto",
                  "barAlignment": 0,
                  "drawStyle": "line",
                  "fillOpacity": 25,
                  "gradientMode": "opacity",
                  "hideFrom": {
                    "legend": false,
                    "tooltip": false,
                    "viz": false
                  },
                  "lineInterpolation": "smooth",
                  "lineWidth": 2,
                  "pointSize": 5,
                  "scaleDistribution": {
                    "type": "linear"
                  },
                  "showPoints": "never",
                  "spanNulls": false,
                  "stacking": {
                    "group": "A",
                    "mode": "none"
                  },
                  "thresholdsStyle": {
                    "mode": "off"
                  }
                },
                "mappings": [],
                "thresholds": {
                  "mode": "absolute",
                  "steps": [
                    {
                      "color": "green",
                      "value": null
                    },
                    {
                      "color": "red",
                      "value": 80
                    }
                  ]
                },
                "unit": "short"
              },
              "overrides": []
            },
            "gridPos": {
              "h": 11,
              "w": 12,
              "x": 12,
              "y": 1
            },
            "id": 32,
            "options": {
              "legend": {
                "calcs": [
                  "min",
                  "max",
                  "mean"
                ],
                "displayMode": "table",
                "placement": "right",
                "showLegend": true,
                "sortBy": "Max",
                "sortDesc": true
              },
              "tooltip": {
                "mode": "multi",
                "sort": "desc"
              }
            },
            "pluginVersion": "8.3.3",
            "targets": [
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "$${datasource}"
                },
                "expr": "sum(kube_pod_container_status_running{namespace=~\"$namespace\"})",
                "interval": "",
                "legendFormat": "Running Pods",
                "refId": "A"
              },
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "$${datasource}"
                },
                "expr": "sum(kube_service_info{namespace=~\"$namespace\"})",
                "interval": "",
                "legendFormat": "Services",
                "refId": "B"
              },
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "$${datasource}"
                },
                "expr": "sum(kube_ingress_info{namespace=~\"$namespace\"})",
                "interval": "",
                "legendFormat": "Ingresses",
                "refId": "C"
              },
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "$${datasource}"
                },
                "expr": "sum(kube_deployment_labels{namespace=~\"$namespace\"})",
                "interval": "",
                "legendFormat": "Deployments",
                "refId": "D"
              },
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "$${datasource}"
                },
                "expr": "sum(kube_statefulset_labels{namespace=~\"$namespace\"})",
                "interval": "",
                "legendFormat": "Statefulsets",
                "refId": "E"
              },
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "$${datasource}"
                },
                "expr": "sum(kube_daemonset_labels{namespace=~\"$namespace\"})",
                "interval": "",
                "legendFormat": "Daemonsets",
                "refId": "F"
              },
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "$${datasource}"
                },
                "expr": "sum(kube_persistentvolumeclaim_info{namespace=~\"$namespace\"})",
                "interval": "",
                "legendFormat": "Persistent Volume Claims",
                "refId": "G"
              },
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "$${datasource}"
                },
                "expr": "sum(kube_hpa_labels{namespace=~\"$namespace\"})",
                "interval": "",
                "legendFormat": "Horizontal Pod Autoscalers",
                "refId": "H"
              },
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "$${datasource}"
                },
                "expr": "sum(kube_configmap_info{namespace=~\"$namespace\"})",
                "interval": "",
                "legendFormat": "Configmaps",
                "refId": "I"
              },
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "$${datasource}"
                },
                "expr": "sum(kube_secret_info{namespace=~\"$namespace\"})",
                "interval": "",
                "legendFormat": "Secrets",
                "refId": "J"
              },
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "$${datasource}"
                },
                "expr": "sum(kube_networkpolicy_labels{namespace=~\"$namespace\"})",
                "interval": "",
                "legendFormat": "Network Policies",
                "refId": "K"
              }
            ],
            "title": "Kubernetes Resource Count",
            "type": "timeseries"
          },
          {
            "datasource": {
              "type": "prometheus",
              "uid": "$${datasource}"
            },
            "fieldConfig": {
              "defaults": {
                "mappings": [],
                "noValue": "0",
                "thresholds": {
                  "mode": "absolute",
                  "steps": [
                    {
                      "color": "rgb(255, 255, 255)",
                      "value": null
                    }
                  ]
                },
                "unit": "none"
              },
              "overrides": []
            },
            "gridPos": {
              "h": 4,
              "w": 6,
              "x": 0,
              "y": 8
            },
            "id": 62,
            "options": {
              "colorMode": "none",
              "graphMode": "none",
              "justifyMode": "center",
              "orientation": "auto",
              "reduceOptions": {
                "calcs": [
                  "mean"
                ],
                "fields": "",
                "values": false
              },
              "text": {},
              "textMode": "auto"
            },
            "pluginVersion": "10.0.3",
            "targets": [
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "$${datasource}"
                },
                "editorMode": "code",
                "exemplar": true,
                "expr": "sum(rate(container_cpu_usage_seconds_total{namespace=~\"$namespace\", image!=\"\"}[$__rate_interval]))",
                "interval": "",
                "legendFormat": "Real",
                "range": true,
                "refId": "A"
              },
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "$${datasource}"
                },
                "editorMode": "code",
                "expr": "sum(kube_pod_container_resource_requests{namespace=~\"$namespace\", resource=\"cpu\"})",
                "hide": false,
                "legendFormat": "Requests",
                "range": true,
                "refId": "B"
              },
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "$${datasource}"
                },
                "editorMode": "code",
                "expr": "sum(kube_pod_container_resource_limits{namespace=~\"$namespace\", resource=\"cpu\"})",
                "hide": false,
                "legendFormat": "Limits",
                "range": true,
                "refId": "C"
              },
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "$${datasource}"
                },
                "editorMode": "code",
                "expr": "sum(machine_cpu_cores)",
                "hide": false,
                "legendFormat": "Cluster Total",
                "range": true,
                "refId": "D"
              }
            ],
            "title": "Namespace(s) CPU Usage in cores",
            "type": "stat"
          },
          {
            "datasource": {
              "type": "prometheus",
              "uid": "$${datasource}"
            },
            "fieldConfig": {
              "defaults": {
                "mappings": [],
                "noValue": "0",
                "thresholds": {
                  "mode": "absolute",
                  "steps": [
                    {
                      "color": "rgb(255, 255, 255)",
                      "value": null
                    }
                  ]
                },
                "unit": "bytes"
              },
              "overrides": []
            },
            "gridPos": {
              "h": 4,
              "w": 6,
              "x": 6,
              "y": 8
            },
            "id": 64,
            "options": {
              "colorMode": "none",
              "graphMode": "none",
              "justifyMode": "auto",
              "orientation": "auto",
              "reduceOptions": {
                "calcs": [
                  "mean"
                ],
                "fields": "",
                "values": false
              },
              "text": {},
              "textMode": "auto"
            },
            "pluginVersion": "10.0.3",
            "targets": [
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "$${datasource}"
                },
                "editorMode": "code",
                "exemplar": true,
                "expr": "sum(container_memory_working_set_bytes{namespace=~\"$namespace\", image!=\"\"})",
                "interval": "",
                "legendFormat": "Real",
                "range": true,
                "refId": "A"
              },
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "$${datasource}"
                },
                "editorMode": "code",
                "expr": "sum(kube_pod_container_resource_requests{namespace=~\"$namespace\", resource=\"memory\"})",
                "hide": false,
                "legendFormat": "Requests",
                "range": true,
                "refId": "B"
              },
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "$${datasource}"
                },
                "editorMode": "code",
                "expr": "sum(kube_pod_container_resource_limits{namespace=~\"$namespace\", resource=\"memory\"})",
                "hide": false,
                "legendFormat": "Limits",
                "range": true,
                "refId": "C"
              },
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "$${datasource}"
                },
                "editorMode": "code",
                "expr": "sum(machine_memory_bytes)",
                "hide": false,
                "legendFormat": "Cluster Total",
                "range": true,
                "refId": "D"
              }
            ],
            "title": "Namespace(s) RAM Usage in bytes",
            "type": "stat"
          },
          {
            "collapsed": false,
            "datasource": {
              "type": "datasource",
              "uid": "grafana"
            },
            "gridPos": {
              "h": 1,
              "w": 24,
              "x": 0,
              "y": 12
            },
            "id": 40,
            "panels": [],
            "title": "Resources",
            "type": "row"
          },
          {
            "datasource": {
              "type": "prometheus",
              "uid": "$${datasource}"
            },
            "fieldConfig": {
              "defaults": {
                "color": {
                  "mode": "palette-classic"
                },
                "custom": {
                  "axisCenteredZero": false,
                  "axisColorMode": "text",
                  "axisLabel": "CPU CORES",
                  "axisPlacement": "auto",
                  "barAlignment": 0,
                  "drawStyle": "line",
                  "fillOpacity": 25,
                  "gradientMode": "opacity",
                  "hideFrom": {
                    "legend": false,
                    "tooltip": false,
                    "viz": false
                  },
                  "lineInterpolation": "smooth",
                  "lineWidth": 2,
                  "pointSize": 5,
                  "scaleDistribution": {
                    "type": "linear"
                  },
                  "showPoints": "never",
                  "spanNulls": false,
                  "stacking": {
                    "group": "A",
                    "mode": "none"
                  },
                  "thresholdsStyle": {
                    "mode": "off"
                  }
                },
                "mappings": [],
                "thresholds": {
                  "mode": "absolute",
                  "steps": [
                    {
                      "color": "green",
                      "value": null
                    },
                    {
                      "color": "red",
                      "value": 80
                    }
                  ]
                },
                "unit": "none"
              },
              "overrides": []
            },
            "gridPos": {
              "h": 8,
              "w": 12,
              "x": 0,
              "y": 13
            },
            "id": 29,
            "options": {
              "legend": {
                "calcs": [],
                "displayMode": "table",
                "placement": "right",
                "showLegend": true
              },
              "tooltip": {
                "mode": "single",
                "sort": "none"
              }
            },
            "pluginVersion": "8.3.3",
            "targets": [
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "$${datasource}"
                },
                "editorMode": "code",
                "exemplar": true,
                "expr": "sum(rate(container_cpu_usage_seconds_total{namespace=~\"$namespace\", image!=\"\", pod=~\"$${created_by}.*\"}[$__rate_interval])) by (pod)",
                "interval": "$resolution",
                "legendFormat": "{{ pod }}",
                "range": true,
                "refId": "A"
              }
            ],
            "title": "CPU usage by Pod",
            "type": "timeseries"
          },
          {
            "datasource": {
              "type": "prometheus",
              "uid": "$${datasource}"
            },
            "fieldConfig": {
              "defaults": {
                "color": {
                  "mode": "palette-classic"
                },
                "custom": {
                  "axisCenteredZero": false,
                  "axisColorMode": "text",
                  "axisLabel": "",
                  "axisPlacement": "auto",
                  "barAlignment": 0,
                  "drawStyle": "line",
                  "fillOpacity": 25,
                  "gradientMode": "opacity",
                  "hideFrom": {
                    "legend": false,
                    "tooltip": false,
                    "viz": false
                  },
                  "lineInterpolation": "smooth",
                  "lineWidth": 2,
                  "pointSize": 5,
                  "scaleDistribution": {
                    "type": "linear"
                  },
                  "showPoints": "never",
                  "spanNulls": false,
                  "stacking": {
                    "group": "A",
                    "mode": "none"
                  },
                  "thresholdsStyle": {
                    "mode": "off"
                  }
                },
                "mappings": [],
                "thresholds": {
                  "mode": "absolute",
                  "steps": [
                    {
                      "color": "green",
                      "value": null
                    },
                    {
                      "color": "red",
                      "value": 80
                    }
                  ]
                },
                "unit": "bytes"
              },
              "overrides": []
            },
            "gridPos": {
              "h": 8,
              "w": 12,
              "x": 12,
              "y": 13
            },
            "id": 30,
            "options": {
              "legend": {
                "calcs": [],
                "displayMode": "table",
                "placement": "right",
                "showLegend": true
              },
              "tooltip": {
                "mode": "single",
                "sort": "none"
              }
            },
            "pluginVersion": "8.3.3",
            "targets": [
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "$${datasource}"
                },
                "editorMode": "code",
                "exemplar": true,
                "expr": "sum(container_memory_working_set_bytes{namespace=~\"$namespace\", image!=\"\", pod=~\"$${created_by}.*\"}) by (pod)",
                "interval": "$resolution",
                "legendFormat": "{{ pod }}",
                "range": true,
                "refId": "A"
              }
            ],
            "title": "Memory usage by Pod",
            "type": "timeseries"
          },
          {
            "datasource": {
              "type": "prometheus",
              "uid": "$${datasource}"
            },
            "description": "",
            "fieldConfig": {
              "defaults": {
                "color": {
                  "mode": "palette-classic"
                },
                "custom": {
                  "axisCenteredZero": false,
                  "axisColorMode": "text",
                  "axisLabel": "SECONDS",
                  "axisPlacement": "auto",
                  "barAlignment": 0,
                  "drawStyle": "line",
                  "fillOpacity": 25,
                  "gradientMode": "opacity",
                  "hideFrom": {
                    "legend": false,
                    "tooltip": false,
                    "viz": false
                  },
                  "lineInterpolation": "smooth",
                  "lineStyle": {
                    "fill": "solid"
                  },
                  "lineWidth": 2,
                  "pointSize": 5,
                  "scaleDistribution": {
                    "type": "linear"
                  },
                  "showPoints": "never",
                  "spanNulls": false,
                  "stacking": {
                    "group": "A",
                    "mode": "none"
                  },
                  "thresholdsStyle": {
                    "mode": "off"
                  }
                },
                "decimals": 2,
                "mappings": [],
                "thresholds": {
                  "mode": "absolute",
                  "steps": [
                    {
                      "color": "green",
                      "value": null
                    },
                    {
                      "color": "red",
                      "value": 80
                    }
                  ]
                },
                "unit": "s"
              },
              "overrides": []
            },
            "gridPos": {
              "h": 8,
              "w": 12,
              "x": 0,
              "y": 21
            },
            "id": 68,
            "options": {
              "legend": {
                "calcs": [
                  "min",
                  "max",
                  "mean"
                ],
                "displayMode": "table",
                "placement": "right",
                "showLegend": true,
                "sortBy": "Max",
                "sortDesc": true
              },
              "tooltip": {
                "mode": "multi",
                "sort": "none"
              }
            },
            "pluginVersion": "8.3.3",
            "targets": [
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "$${datasource}"
                },
                "editorMode": "code",
                "exemplar": true,
                "expr": "sum(rate(container_cpu_cfs_throttled_seconds_total{namespace=~\"$namespace\", image!=\"\", pod=~\"$${created_by}.*\"}[$__rate_interval])) by (pod) > 0",
                "interval": "$resolution",
                "legendFormat": "{{ pod }}",
                "range": true,
                "refId": "A"
              }
            ],
            "title": "CPU Throttled seconds by pod",
            "type": "timeseries"
          },
          {
            "collapsed": false,
            "gridPos": {
              "h": 1,
              "w": 24,
              "x": 0,
              "y": 29
            },
            "id": 73,
            "panels": [],
            "title": "Kubernetes",
            "type": "row"
          },
          {
            "datasource": {
              "type": "prometheus",
              "uid": "$${datasource}"
            },
            "fieldConfig": {
              "defaults": {
                "color": {
                  "mode": "palette-classic"
                },
                "custom": {
                  "axisCenteredZero": false,
                  "axisColorMode": "text",
                  "axisLabel": "",
                  "axisPlacement": "auto",
                  "barAlignment": 0,
                  "drawStyle": "line",
                  "fillOpacity": 25,
                  "gradientMode": "opacity",
                  "hideFrom": {
                    "legend": false,
                    "tooltip": false,
                    "viz": false
                  },
                  "lineInterpolation": "smooth",
                  "lineWidth": 2,
                  "pointSize": 5,
                  "scaleDistribution": {
                    "type": "linear"
                  },
                  "showPoints": "never",
                  "spanNulls": false,
                  "stacking": {
                    "group": "A",
                    "mode": "none"
                  },
                  "thresholdsStyle": {
                    "mode": "off"
                  }
                },
                "mappings": [],
                "thresholds": {
                  "mode": "absolute",
                  "steps": [
                    {
                      "color": "green",
                      "value": null
                    },
                    {
                      "color": "red",
                      "value": 80
                    }
                  ]
                },
                "unit": "short"
              },
              "overrides": []
            },
            "gridPos": {
              "h": 9,
              "w": 12,
              "x": 0,
              "y": 30
            },
            "id": 70,
            "options": {
              "legend": {
                "calcs": [
                  "min",
                  "max",
                  "mean"
                ],
                "displayMode": "table",
                "placement": "right",
                "showLegend": true,
                "sortBy": "Max",
                "sortDesc": true
              },
              "tooltip": {
                "mode": "multi",
                "sort": "none"
              }
            },
            "pluginVersion": "8.3.3",
            "targets": [
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "$${datasource}"
                },
                "editorMode": "code",
                "exemplar": true,
                "expr": "sum(kube_pod_status_qos_class{namespace=~\"$namespace\"}) by (qos_class)",
                "interval": "",
                "legendFormat": "{{ qos_class }} pods",
                "range": true,
                "refId": "A"
              },
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "$${datasource}"
                },
                "editorMode": "code",
                "expr": "sum(kube_pod_info{namespace=~\"$namespace\"})",
                "hide": false,
                "legendFormat": "Total pods",
                "range": true,
                "refId": "B"
              }
            ],
            "title": "Kubernetes Pods QoS classes",
            "type": "timeseries"
          },
          {
            "datasource": {
              "type": "prometheus",
              "uid": "$${datasource}"
            },
            "fieldConfig": {
              "defaults": {
                "color": {
                  "mode": "palette-classic"
                },
                "custom": {
                  "axisCenteredZero": false,
                  "axisColorMode": "text",
                  "axisLabel": "",
                  "axisPlacement": "auto",
                  "barAlignment": 0,
                  "drawStyle": "line",
                  "fillOpacity": 25,
                  "gradientMode": "opacity",
                  "hideFrom": {
                    "legend": false,
                    "tooltip": false,
                    "viz": false
                  },
                  "lineInterpolation": "smooth",
                  "lineWidth": 2,
                  "pointSize": 5,
                  "scaleDistribution": {
                    "type": "linear"
                  },
                  "showPoints": "never",
                  "spanNulls": false,
                  "stacking": {
                    "group": "A",
                    "mode": "none"
                  },
                  "thresholdsStyle": {
                    "mode": "off"
                  }
                },
                "mappings": [],
                "thresholds": {
                  "mode": "absolute",
                  "steps": [
                    {
                      "color": "green",
                      "value": null
                    },
                    {
                      "color": "red",
                      "value": 80
                    }
                  ]
                },
                "unit": "short"
              },
              "overrides": []
            },
            "gridPos": {
              "h": 9,
              "w": 12,
              "x": 12,
              "y": 30
            },
            "id": 72,
            "options": {
              "legend": {
                "calcs": [
                  "min",
                  "max",
                  "mean"
                ],
                "displayMode": "table",
                "placement": "right",
                "showLegend": true,
                "sortBy": "Max",
                "sortDesc": true
              },
              "tooltip": {
                "mode": "multi",
                "sort": "none"
              }
            },
            "pluginVersion": "8.3.3",
            "targets": [
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "$${datasource}"
                },
                "editorMode": "code",
                "exemplar": true,
                "expr": "sum(kube_pod_status_reason) by (reason)",
                "interval": "",
                "legendFormat": "{{ reason }}",
                "range": true,
                "refId": "A"
              }
            ],
            "title": "Kubernetes Pods Status Reason",
            "type": "timeseries"
          },
          {
            "datasource": {
              "type": "prometheus",
              "uid": "$${datasource}"
            },
            "description": "No data is generally a good thing here.",
            "fieldConfig": {
              "defaults": {
                "color": {
                  "mode": "palette-classic"
                },
                "custom": {
                  "axisCenteredZero": false,
                  "axisColorMode": "text",
                  "axisLabel": "",
                  "axisPlacement": "auto",
                  "barAlignment": 0,
                  "drawStyle": "points",
                  "fillOpacity": 25,
                  "gradientMode": "opacity",
                  "hideFrom": {
                    "legend": false,
                    "tooltip": false,
                    "viz": false
                  },
                  "lineInterpolation": "smooth",
                  "lineWidth": 2,
                  "pointSize": 5,
                  "scaleDistribution": {
                    "type": "linear"
                  },
                  "showPoints": "never",
                  "spanNulls": false,
                  "stacking": {
                    "group": "A",
                    "mode": "none"
                  },
                  "thresholdsStyle": {
                    "mode": "off"
                  }
                },
                "mappings": [],
                "thresholds": {
                  "mode": "absolute",
                  "steps": [
                    {
                      "color": "green",
                      "value": null
                    },
                    {
                      "color": "red",
                      "value": 80
                    }
                  ]
                },
                "unit": "short"
              },
              "overrides": []
            },
            "gridPos": {
              "h": 9,
              "w": 12,
              "x": 0,
              "y": 39
            },
            "id": 74,
            "options": {
              "legend": {
                "calcs": [
                  "min",
                  "max",
                  "mean"
                ],
                "displayMode": "table",
                "placement": "right",
                "showLegend": true,
                "sortBy": "Max",
                "sortDesc": true
              },
              "tooltip": {
                "mode": "multi",
                "sort": "none"
              }
            },
            "pluginVersion": "8.3.3",
            "targets": [
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "$${datasource}"
                },
                "editorMode": "code",
                "exemplar": true,
                "expr": "sum(increase(container_oom_events_total{namespace=~\"$${namespace}\"}[$__rate_interval])) by (namespace, pod) > 0",
                "interval": "",
                "legendFormat": "namespace: {{ namespace }} - pod: {{ pod }}",
                "range": true,
                "refId": "A"
              }
            ],
            "title": "OOM Events by namespace, pod",
            "type": "timeseries"
          },
          {
            "datasource": {
              "type": "prometheus",
              "uid": "$${datasource}"
            },
            "description": "No data is generally a good thing here.",
            "fieldConfig": {
              "defaults": {
                "color": {
                  "mode": "palette-classic"
                },
                "custom": {
                  "axisCenteredZero": false,
                  "axisColorMode": "text",
                  "axisLabel": "",
                  "axisPlacement": "auto",
                  "barAlignment": 0,
                  "drawStyle": "points",
                  "fillOpacity": 25,
                  "gradientMode": "opacity",
                  "hideFrom": {
                    "legend": false,
                    "tooltip": false,
                    "viz": false
                  },
                  "lineInterpolation": "smooth",
                  "lineWidth": 2,
                  "pointSize": 5,
                  "scaleDistribution": {
                    "type": "linear"
                  },
                  "showPoints": "never",
                  "spanNulls": false,
                  "stacking": {
                    "group": "A",
                    "mode": "none"
                  },
                  "thresholdsStyle": {
                    "mode": "off"
                  }
                },
                "mappings": [],
                "thresholds": {
                  "mode": "absolute",
                  "steps": [
                    {
                      "color": "green",
                      "value": null
                    },
                    {
                      "color": "red",
                      "value": 80
                    }
                  ]
                },
                "unit": "short"
              },
              "overrides": []
            },
            "gridPos": {
              "h": 9,
              "w": 12,
              "x": 12,
              "y": 39
            },
            "id": 75,
            "options": {
              "legend": {
                "calcs": [
                  "min",
                  "max",
                  "mean"
                ],
                "displayMode": "table",
                "placement": "right",
                "showLegend": true,
                "sortBy": "Max",
                "sortDesc": true
              },
              "tooltip": {
                "mode": "multi",
                "sort": "none"
              }
            },
            "pluginVersion": "8.3.3",
            "targets": [
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "$${datasource}"
                },
                "editorMode": "code",
                "exemplar": true,
                "expr": "sum(increase(kube_pod_container_status_restarts_total{namespace=~\"$${namespace}\"}[$__rate_interval])) by (namespace, pod) > 0",
                "interval": "",
                "legendFormat": "namespace: {{ namespace }} - pod: {{ pod }}",
                "range": true,
                "refId": "A"
              }
            ],
            "title": "Container Restarts by namespace, pod",
            "type": "timeseries"
          },
          {
            "datasource": {
              "type": "prometheus",
              "uid": "$${datasource}"
            },
            "fieldConfig": {
              "defaults": {
                "color": {
                  "mode": "palette-classic"
                },
                "custom": {
                  "axisCenteredZero": false,
                  "axisColorMode": "text",
                  "axisLabel": "",
                  "axisPlacement": "auto",
                  "barAlignment": 0,
                  "drawStyle": "line",
                  "fillOpacity": 25,
                  "gradientMode": "opacity",
                  "hideFrom": {
                    "legend": false,
                    "tooltip": false,
                    "viz": false
                  },
                  "lineInterpolation": "smooth",
                  "lineWidth": 2,
                  "pointSize": 5,
                  "scaleDistribution": {
                    "type": "linear"
                  },
                  "showPoints": "never",
                  "spanNulls": false,
                  "stacking": {
                    "group": "A",
                    "mode": "none"
                  },
                  "thresholdsStyle": {
                    "mode": "off"
                  }
                },
                "decimals": 0,
                "mappings": [],
                "thresholds": {
                  "mode": "absolute",
                  "steps": [
                    {
                      "color": "green",
                      "value": null
                    },
                    {
                      "color": "red",
                      "value": 80
                    }
                  ]
                },
                "unit": "none"
              },
              "overrides": []
            },
            "gridPos": {
              "h": 8,
              "w": 12,
              "x": 0,
              "y": 48
            },
            "id": 5,
            "options": {
              "legend": {
                "calcs": [],
                "displayMode": "table",
                "placement": "right",
                "showLegend": true
              },
              "tooltip": {
                "mode": "multi",
                "sort": "desc"
              }
            },
            "pluginVersion": "8.3.3",
            "targets": [
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "$${datasource}"
                },
                "editorMode": "code",
                "expr": "sum(kube_pod_container_status_ready{namespace=~\"$namespace\", pod=~\"$${created_by}.*\"})",
                "interval": "",
                "legendFormat": "Ready",
                "range": true,
                "refId": "A"
              },
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "$${datasource}"
                },
                "editorMode": "code",
                "expr": "sum(kube_pod_container_status_running{namespace=~\"$namespace\", pod=~\"$${created_by}.*\"})",
                "interval": "",
                "legendFormat": "Running",
                "range": true,
                "refId": "B"
              },
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "$${datasource}"
                },
                "expr": "sum(kube_pod_container_status_waiting{namespace=~\"$namespace\"})",
                "interval": "",
                "legendFormat": "Waiting",
                "refId": "C"
              },
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "$${datasource}"
                },
                "expr": "sum(kube_pod_container_status_restarts_total{namespace=~\"$namespace\"})",
                "interval": "",
                "legendFormat": "Restarts Total",
                "refId": "D"
              },
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "$${datasource}"
                },
                "expr": "sum(kube_pod_container_status_terminated{namespace=~\"$namespace\"})",
                "interval": "",
                "legendFormat": "Terminated",
                "refId": "E"
              }
            ],
            "title": "Nb of pods by state",
            "type": "timeseries"
          },
          {
            "datasource": {
              "type": "prometheus",
              "uid": "$${datasource}"
            },
            "fieldConfig": {
              "defaults": {
                "color": {
                  "mode": "palette-classic"
                },
                "custom": {
                  "axisCenteredZero": false,
                  "axisColorMode": "text",
                  "axisLabel": "",
                  "axisPlacement": "auto",
                  "barAlignment": 0,
                  "drawStyle": "line",
                  "fillOpacity": 25,
                  "gradientMode": "opacity",
                  "hideFrom": {
                    "legend": false,
                    "tooltip": false,
                    "viz": false
                  },
                  "lineInterpolation": "smooth",
                  "lineWidth": 2,
                  "pointSize": 5,
                  "scaleDistribution": {
                    "type": "linear"
                  },
                  "showPoints": "never",
                  "spanNulls": false,
                  "stacking": {
                    "group": "A",
                    "mode": "none"
                  },
                  "thresholdsStyle": {
                    "mode": "off"
                  }
                },
                "decimals": 0,
                "mappings": [],
                "thresholds": {
                  "mode": "absolute",
                  "steps": [
                    {
                      "color": "green",
                      "value": null
                    },
                    {
                      "color": "red",
                      "value": 80
                    }
                  ]
                },
                "unit": "none"
              },
              "overrides": []
            },
            "gridPos": {
              "h": 8,
              "w": 12,
              "x": 12,
              "y": 48
            },
            "id": 2,
            "options": {
              "legend": {
                "calcs": [],
                "displayMode": "hidden",
                "placement": "right",
                "showLegend": false
              },
              "tooltip": {
                "mode": "multi",
                "sort": "none"
              }
            },
            "pluginVersion": "8.3.3",
            "targets": [
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "$${datasource}"
                },
                "editorMode": "code",
                "expr": "sum(kube_pod_container_info{namespace=~\"$namespace\", pod=~\"$${created_by}.*\"}) by (pod)",
                "interval": "",
                "legendFormat": "{{ pod }}",
                "range": true,
                "refId": "A"
              }
            ],
            "title": "Nb of containers by pod",
            "type": "timeseries"
          },
          {
            "datasource": {
              "type": "prometheus",
              "uid": "$${datasource}"
            },
            "fieldConfig": {
              "defaults": {
                "color": {
                  "mode": "palette-classic"
                },
                "custom": {
                  "axisCenteredZero": false,
                  "axisColorMode": "text",
                  "axisLabel": "",
                  "axisPlacement": "auto",
                  "barAlignment": 0,
                  "drawStyle": "line",
                  "fillOpacity": 25,
                  "gradientMode": "opacity",
                  "hideFrom": {
                    "legend": false,
                    "tooltip": false,
                    "viz": false
                  },
                  "lineInterpolation": "smooth",
                  "lineWidth": 2,
                  "pointSize": 5,
                  "scaleDistribution": {
                    "type": "linear"
                  },
                  "showPoints": "never",
                  "spanNulls": false,
                  "stacking": {
                    "group": "A",
                    "mode": "none"
                  },
                  "thresholdsStyle": {
                    "mode": "off"
                  }
                },
                "mappings": [],
                "thresholds": {
                  "mode": "absolute",
                  "steps": [
                    {
                      "color": "green",
                      "value": null
                    },
                    {
                      "color": "red",
                      "value": 80
                    }
                  ]
                },
                "unit": "short"
              },
              "overrides": []
            },
            "gridPos": {
              "h": 8,
              "w": 12,
              "x": 0,
              "y": 56
            },
            "id": 7,
            "options": {
              "legend": {
                "calcs": [],
                "displayMode": "table",
                "placement": "right",
                "showLegend": false
              },
              "tooltip": {
                "mode": "multi",
                "sort": "none"
              }
            },
            "pluginVersion": "8.3.3",
            "targets": [
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "$${datasource}"
                },
                "editorMode": "code",
                "exemplar": true,
                "expr": "sum(kube_deployment_status_replicas_available{namespace=~\"$namespace\"}) by (deployment)",
                "interval": "",
                "legendFormat": "{{ deployment }}",
                "range": true,
                "refId": "A"
              }
            ],
            "title": "Replicas available by deployment",
            "type": "timeseries"
          },
          {
            "datasource": {
              "type": "prometheus",
              "uid": "$${datasource}"
            },
            "fieldConfig": {
              "defaults": {
                "color": {
                  "mode": "palette-classic"
                },
                "custom": {
                  "axisCenteredZero": false,
                  "axisColorMode": "text",
                  "axisLabel": "",
                  "axisPlacement": "auto",
                  "barAlignment": 0,
                  "drawStyle": "line",
                  "fillOpacity": 25,
                  "gradientMode": "opacity",
                  "hideFrom": {
                    "legend": false,
                    "tooltip": false,
                    "viz": false
                  },
                  "lineInterpolation": "smooth",
                  "lineWidth": 2,
                  "pointSize": 5,
                  "scaleDistribution": {
                    "type": "linear"
                  },
                  "showPoints": "never",
                  "spanNulls": false,
                  "stacking": {
                    "group": "A",
                    "mode": "none"
                  },
                  "thresholdsStyle": {
                    "mode": "off"
                  }
                },
                "mappings": [],
                "thresholds": {
                  "mode": "absolute",
                  "steps": [
                    {
                      "color": "green",
                      "value": null
                    },
                    {
                      "color": "red",
                      "value": 80
                    }
                  ]
                },
                "unit": "short"
              },
              "overrides": []
            },
            "gridPos": {
              "h": 8,
              "w": 12,
              "x": 12,
              "y": 56
            },
            "id": 8,
            "options": {
              "legend": {
                "calcs": [],
                "displayMode": "table",
                "placement": "right",
                "showLegend": false
              },
              "tooltip": {
                "mode": "multi",
                "sort": "none"
              }
            },
            "pluginVersion": "8.3.3",
            "targets": [
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "$${datasource}"
                },
                "editorMode": "code",
                "expr": "sum(kube_deployment_status_replicas_unavailable{namespace=~\"$namespace\", pod=~\"$${created_by}.*\"}) by (deployment)",
                "interval": "",
                "legendFormat": "{{ deployment }}",
                "range": true,
                "refId": "A"
              }
            ],
            "title": "Replicas unavailable by deployment",
            "type": "timeseries"
          },
          {
            "collapsed": false,
            "datasource": {
              "type": "datasource",
              "uid": "grafana"
            },
            "gridPos": {
              "h": 1,
              "w": 24,
              "x": 0,
              "y": 64
            },
            "id": 42,
            "panels": [],
            "title": "Kubernetes Storage",
            "type": "row"
          },
          {
            "datasource": {
              "type": "prometheus",
              "uid": "$${datasource}"
            },
            "fieldConfig": {
              "defaults": {
                "color": {
                  "mode": "palette-classic"
                },
                "custom": {
                  "axisCenteredZero": false,
                  "axisColorMode": "text",
                  "axisLabel": "",
                  "axisPlacement": "auto",
                  "barAlignment": 0,
                  "drawStyle": "line",
                  "fillOpacity": 25,
                  "gradientMode": "opacity",
                  "hideFrom": {
                    "legend": false,
                    "tooltip": false,
                    "viz": false
                  },
                  "lineInterpolation": "smooth",
                  "lineWidth": 2,
                  "pointSize": 5,
                  "scaleDistribution": {
                    "type": "linear"
                  },
                  "showPoints": "never",
                  "spanNulls": false,
                  "stacking": {
                    "group": "A",
                    "mode": "none"
                  },
                  "thresholdsStyle": {
                    "mode": "off"
                  }
                },
                "decimals": 2,
                "mappings": [],
                "thresholds": {
                  "mode": "absolute",
                  "steps": [
                    {
                      "color": "green",
                      "value": null
                    },
                    {
                      "color": "red",
                      "value": 80
                    }
                  ]
                },
                "unit": "percentunit"
              },
              "overrides": []
            },
            "gridPos": {
              "h": 8,
              "w": 12,
              "x": 0,
              "y": 65
            },
            "id": 65,
            "options": {
              "legend": {
                "calcs": [],
                "displayMode": "table",
                "placement": "right",
                "showLegend": false
              },
              "tooltip": {
                "mode": "multi",
                "sort": "desc"
              }
            },
            "pluginVersion": "8.3.3",
            "targets": [
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "$${datasource}"
                },
                "exemplar": true,
                "expr": "sum(kubelet_volume_stats_used_bytes{namespace=~\"$namespace\"}) by (persistentvolumeclaim) / sum(kubelet_volume_stats_capacity_bytes{namespace=~\"$namespace\"}) by (persistentvolumeclaim)",
                "interval": "",
                "legendFormat": "{{ persistentvolumeclaim }}",
                "refId": "A"
              }
            ],
            "title": "Persistent Volumes - Capacity and usage in %",
            "type": "timeseries"
          },
          {
            "datasource": {
              "type": "prometheus",
              "uid": "$${datasource}"
            },
            "fieldConfig": {
              "defaults": {
                "color": {
                  "mode": "palette-classic"
                },
                "custom": {
                  "axisCenteredZero": false,
                  "axisColorMode": "text",
                  "axisLabel": "",
                  "axisPlacement": "auto",
                  "barAlignment": 0,
                  "drawStyle": "line",
                  "fillOpacity": 25,
                  "gradientMode": "opacity",
                  "hideFrom": {
                    "legend": false,
                    "tooltip": false,
                    "viz": false
                  },
                  "lineInterpolation": "smooth",
                  "lineWidth": 2,
                  "pointSize": 5,
                  "scaleDistribution": {
                    "type": "linear"
                  },
                  "showPoints": "never",
                  "spanNulls": false,
                  "stacking": {
                    "group": "A",
                    "mode": "none"
                  },
                  "thresholdsStyle": {
                    "mode": "off"
                  }
                },
                "decimals": 2,
                "mappings": [],
                "thresholds": {
                  "mode": "absolute",
                  "steps": [
                    {
                      "color": "green",
                      "value": null
                    },
                    {
                      "color": "red",
                      "value": 80
                    }
                  ]
                },
                "unit": "bytes"
              },
              "overrides": []
            },
            "gridPos": {
              "h": 8,
              "w": 12,
              "x": 12,
              "y": 65
            },
            "id": 66,
            "options": {
              "legend": {
                "calcs": [],
                "displayMode": "table",
                "placement": "right",
                "showLegend": false
              },
              "tooltip": {
                "mode": "multi",
                "sort": "desc"
              }
            },
            "pluginVersion": "8.3.3",
            "targets": [
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "$${datasource}"
                },
                "exemplar": true,
                "expr": "sum(kubelet_volume_stats_used_bytes{namespace=~\"$namespace\"}) by (persistentvolumeclaim)",
                "interval": "",
                "legendFormat": "{{ persistentvolumeclaim }} - Used",
                "refId": "A"
              },
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "$${datasource}"
                },
                "exemplar": true,
                "expr": "sum(kubelet_volume_stats_capacity_bytes{namespace=~\"$namespace\"}) by (persistentvolumeclaim)",
                "hide": false,
                "interval": "",
                "legendFormat": "{{ persistentvolumeclaim }} - Capacity",
                "refId": "B"
              }
            ],
            "title": "Persistent Volumes - Capacity and usage in bytes",
            "type": "timeseries"
          },
          {
            "datasource": {
              "type": "prometheus",
              "uid": "$${datasource}"
            },
            "fieldConfig": {
              "defaults": {
                "color": {
                  "mode": "palette-classic"
                },
                "custom": {
                  "axisCenteredZero": false,
                  "axisColorMode": "text",
                  "axisLabel": "",
                  "axisPlacement": "auto",
                  "barAlignment": 0,
                  "drawStyle": "line",
                  "fillOpacity": 25,
                  "gradientMode": "opacity",
                  "hideFrom": {
                    "legend": false,
                    "tooltip": false,
                    "viz": false
                  },
                  "lineInterpolation": "smooth",
                  "lineWidth": 2,
                  "pointSize": 5,
                  "scaleDistribution": {
                    "type": "linear"
                  },
                  "showPoints": "never",
                  "spanNulls": false,
                  "stacking": {
                    "group": "A",
                    "mode": "none"
                  },
                  "thresholdsStyle": {
                    "mode": "off"
                  }
                },
                "decimals": 2,
                "mappings": [],
                "thresholds": {
                  "mode": "absolute",
                  "steps": [
                    {
                      "color": "green",
                      "value": null
                    },
                    {
                      "color": "red",
                      "value": 80
                    }
                  ]
                },
                "unit": "percentunit"
              },
              "overrides": []
            },
            "gridPos": {
              "h": 8,
              "w": 12,
              "x": 0,
              "y": 73
            },
            "id": 27,
            "options": {
              "legend": {
                "calcs": [],
                "displayMode": "table",
                "placement": "right",
                "showLegend": false
              },
              "tooltip": {
                "mode": "multi",
                "sort": "desc"
              }
            },
            "pluginVersion": "8.3.3",
            "targets": [
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "$${datasource}"
                },
                "exemplar": true,
                "expr": "1 - sum(kubelet_volume_stats_inodes_used{namespace=~\"$namespace\"}) by (persistentvolumeclaim) / sum(kubelet_volume_stats_inodes{namespace=~\"$namespace\"}) by (persistentvolumeclaim)",
                "interval": "",
                "legendFormat": "{{ persistentvolumeclaim }}",
                "refId": "A"
              }
            ],
            "title": "Persistent Volumes - Inodes",
            "type": "timeseries"
          }
        ],
        "refresh": "30s",
        "schemaVersion": 38,
        "style": "dark",
        "tags": [
          "Kubernetes",
          "Prometheus"
        ],
        "templating": {
          "list": [
            {
              "current": {
                "selected": false,
                "text": "Prometheus",
                "value": "Prometheus"
              },
              "hide": 0,
              "includeAll": false,
              "multi": false,
              "name": "datasource",
              "options": [],
              "query": "prometheus",
              "queryValue": "",
              "refresh": 1,
              "regex": "",
              "skipUrlSync": false,
              "type": "datasource"
            },
            {
              "current": {
                "selected": true,
                "text": [
                  "monitoring"
                ],
                "value": [
                  "monitoring"
                ]
              },
              "datasource": {
                "type": "prometheus",
                "uid": "$${datasource}"
              },
              "definition": "label_values(kube_pod_info, namespace)",
              "hide": 0,
              "includeAll": true,
              "multi": true,
              "name": "namespace",
              "options": [],
              "query": {
                "query": "label_values(kube_pod_info, namespace)",
                "refId": "StandardVariableQuery"
              },
              "refresh": 1,
              "regex": "",
              "skipUrlSync": false,
              "sort": 1,
              "tagValuesQuery": "",
              "tagsQuery": "",
              "type": "query",
              "useTags": false
            },
            {
              "current": {
                "selected": true,
                "text": "30s",
                "value": "30s"
              },
              "hide": 0,
              "includeAll": false,
              "multi": false,
              "name": "resolution",
              "options": [
                {
                  "selected": false,
                  "text": "1s",
                  "value": "1s"
                },
                {
                  "selected": false,
                  "text": "15s",
                  "value": "15s"
                },
                {
                  "selected": true,
                  "text": "30s",
                  "value": "30s"
                },
                {
                  "selected": false,
                  "text": "1m",
                  "value": "1m"
                },
                {
                  "selected": false,
                  "text": "3m",
                  "value": "3m"
                },
                {
                  "selected": false,
                  "text": "5m",
                  "value": "5m"
                }
              ],
              "query": "1s, 15s, 30s, 1m, 3m, 5m",
              "queryValue": "",
              "skipUrlSync": false,
              "type": "custom"
            },
            {
              "current": {
                "selected": false,
                "text": "All",
                "value": "$__all"
              },
              "datasource": {
                "type": "prometheus",
                "uid": "$${datasource}"
              },
              "definition": "label_values(kube_pod_info{namespace=~\"$namespace\", container!=\"\"},created_by_name)",
              "description": "Can be used to filter on a specific deployment, statefulset or deamonset (only relevant panels).",
              "hide": 0,
              "includeAll": true,
              "multi": true,
              "name": "created_by",
              "options": [],
              "query": {
                "query": "label_values(kube_pod_info{namespace=~\"$namespace\", container!=\"\"},created_by_name)",
                "refId": "PrometheusVariableQueryEditor-VariableQuery"
              },
              "refresh": 1,
              "regex": "",
              "skipUrlSync": false,
              "sort": 1,
              "type": "query"
            }
          ]
        },
        "time": {
          "from": "now-1h",
          "to": "now"
        },
        "timepicker": {},
        "timezone": "",
        "title": "Kubernetes / Views / Namespaces",
        "uid": "k8s_views_ns",
        "version": 27,
        "weekStart": ""
      }
      
      EOT
    }
    "kind" = "ConfigMap"
    "metadata" = {
      "annotations" = {
        "grafana_folder" = "Kubernetes"
      }
      "labels" = {
        "grafana_dashboard" = "1"
      }
      "name"      = "dashboards-k8s-views-namespaces"
      "namespace" = "prometheus"
    }
  }
}

resource "kubernetes_manifest" "configmap_prometheus_dashboards_k8s_views_nodes" {
  manifest = {
    "apiVersion" = "v1"
    "data" = {
      "k8s-views-nodes.json" = <<-EOT
      {
        "__inputs": [
          {
            "name": "DS_PROMETHEUS",
            "label": "Prometheus",
            "description": "",
            "type": "datasource",
            "pluginId": "prometheus",
            "pluginName": "Prometheus"
          }
        ],
        "__elements": [],
        "__requires": [
          {
            "type": "grafana",
            "id": "grafana",
            "name": "Grafana",
            "version": "8.3.4"
          },
          {
            "type": "datasource",
            "id": "prometheus",
            "name": "Prometheus",
            "version": "5.0.0"
          },
          {
            "type": "panel",
            "id": "timeseries",
            "name": "Time series",
            "version": ""
          },
          {
            "type": "panel",
            "id": "stat",
            "name": "Stat",
            "version": ""
          },
          {
            "type": "panel",
            "id": "gauge",
            "name": "Gauge",
            "version": ""
          },
          {
            "type": "panel",
            "id": "table",
            "name": "Table",
            "version": ""
          }
        ],
        "annotations": {
          "list": [
            {
              "builtIn": 1,
              "datasource": {
                "type": "datasource",
                "uid": "grafana"
              },
              "enable": true,
              "hide": true,
              "iconColor": "rgba(0, 211, 255, 1)",
              "name": "Annotations & Alerts",
              "target": {
                "limit": 100,
                "matchAny": false,
                "tags": [],
                "type": "dashboard"
              },
              "type": "dashboard"
            }
          ]
        },
        "description": "This is a modern 'Nodes View' dashboard for your Kubernetes cluster(s). Made for kube-prometheus-stack and take advantage of the latest Grafana features. GitHub repository: https://github.com/dotdc/grafana-dashboards-kubernetes",
        "editable": true,
        "fiscalYearStartMonth": 0,
        "graphTooltip": 1,
        "links": [],
        "liveNow": false,
        "panels": [
          {
            "collapsed": false,
            "datasource": {
              "type": "prometheus",
              "uid": "prometheus"
            },
            "gridPos": {
              "h": 1,
              "w": 24,
              "x": 0,
              "y": 0
            },
            "id": 40,
            "panels": [],
            "title": "Overview",
            "type": "row"
          },
          {
            "datasource": {
              "type": "prometheus",
              "uid": "$${datasource}"
            },
            "fieldConfig": {
              "defaults": {
                "decimals": 2,
                "mappings": [],
                "max": 1,
                "min": 0,
                "thresholds": {
                  "mode": "percentage",
                  "steps": [
                    {
                      "color": "green",
                      "value": null
                    },
                    {
                      "color": "orange",
                      "value": 50
                    },
                    {
                      "color": "red",
                      "value": 70
                    }
                  ]
                },
                "unit": "percentunit"
              },
              "overrides": []
            },
            "gridPos": {
              "h": 8,
              "w": 4,
              "x": 0,
              "y": 1
            },
            "id": 7,
            "options": {
              "orientation": "auto",
              "reduceOptions": {
                "calcs": [
                  "mean"
                ],
                "fields": "",
                "values": false
              },
              "showThresholdLabels": false,
              "showThresholdMarkers": true,
              "text": {}
            },
            "pluginVersion": "9.3.8",
            "targets": [
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "$${datasource}"
                },
                "exemplar": false,
                "expr": "avg(1-rate(node_cpu_seconds_total{mode=\"idle\", instance=\"$instance\"}[$__rate_interval]))",
                "instant": true,
                "interval": "$resolution",
                "legendFormat": "",
                "refId": "A"
              }
            ],
            "title": "CPU  Usage",
            "type": "gauge"
          },
          {
            "datasource": {
              "type": "prometheus",
              "uid": "$${datasource}"
            },
            "fieldConfig": {
              "defaults": {
                "decimals": 2,
                "mappings": [],
                "max": 1,
                "min": 0,
                "thresholds": {
                  "mode": "percentage",
                  "steps": [
                    {
                      "color": "green",
                      "value": null
                    },
                    {
                      "color": "orange",
                      "value": 50
                    },
                    {
                      "color": "red",
                      "value": 70
                    }
                  ]
                },
                "unit": "percentunit"
              },
              "overrides": []
            },
            "gridPos": {
              "h": 8,
              "w": 4,
              "x": 4,
              "y": 1
            },
            "id": 13,
            "options": {
              "orientation": "auto",
              "reduceOptions": {
                "calcs": [
                  "lastNotNull"
                ],
                "fields": "",
                "values": false
              },
              "showThresholdLabels": false,
              "showThresholdMarkers": true,
              "text": {}
            },
            "pluginVersion": "9.3.8",
            "targets": [
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "$${datasource}"
                },
                "exemplar": false,
                "expr": "sum(node_memory_MemTotal_bytes{instance=\"$instance\"} - node_memory_MemAvailable_bytes{instance=\"$instance\"}) / sum(node_memory_MemTotal_bytes{instance=\"$instance\"})",
                "instant": true,
                "interval": "$resolution",
                "legendFormat": "",
                "refId": "A"
              }
            ],
            "title": "RAM Usage",
            "type": "gauge"
          },
          {
            "datasource": {
              "type": "prometheus",
              "uid": "$${datasource}"
            },
            "fieldConfig": {
              "defaults": {
                "mappings": [],
                "noValue": "0",
                "thresholds": {
                  "mode": "absolute",
                  "steps": [
                    {
                      "color": "blue",
                      "value": null
                    }
                  ]
                }
              },
              "overrides": []
            },
            "gridPos": {
              "h": 8,
              "w": 4,
              "x": 8,
              "y": 1
            },
            "id": 24,
            "options": {
              "colorMode": "value",
              "graphMode": "none",
              "justifyMode": "auto",
              "orientation": "auto",
              "reduceOptions": {
                "calcs": [
                  "last"
                ],
                "fields": "",
                "values": false
              },
              "text": {},
              "textMode": "value"
            },
            "pluginVersion": "9.3.8",
            "targets": [
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "$${datasource}"
                },
                "exemplar": true,
                "expr": "sum(kube_pod_info{node=\"$node\"})",
                "interval": "",
                "legendFormat": "",
                "refId": "A"
              }
            ],
            "title": "Pods on node",
            "type": "stat"
          },
          {
            "datasource": {
              "type": "prometheus",
              "uid": "$${datasource}"
            },
            "fieldConfig": {
              "defaults": {
                "color": {
                  "mode": "thresholds"
                },
                "custom": {
                  "align": "auto",
                  "displayMode": "auto",
                  "inspect": false
                },
                "links": [
                  {
                    "targetBlank": true,
                    "title": "Pod details",
                    "url": "/d/k8s_views_pods/kubernetes-views-pods?$${datasource:queryparam}&var-namespace=$${__data.fields.namespace}&var-pod=$${__data.fields.pod}&$${resolution:queryparam}&$${__url_time_range}"
                  }
                ],
                "mappings": [],
                "thresholds": {
                  "mode": "absolute",
                  "steps": [
                    {
                      "color": "green",
                      "value": null
                    },
                    {
                      "color": "red",
                      "value": 80
                    }
                  ]
                }
              },
              "overrides": [
                {
                  "matcher": {
                    "id": "byName",
                    "options": "pod"
                  },
                  "properties": [
                    {
                      "id": "custom.width",
                      "value": 416
                    }
                  ]
                },
                {
                  "matcher": {
                    "id": "byName",
                    "options": "priority_class"
                  },
                  "properties": [
                    {
                      "id": "custom.width",
                      "value": 176
                    }
                  ]
                },
                {
                  "matcher": {
                    "id": "byName",
                    "options": "pod_ip"
                  },
                  "properties": [
                    {
                      "id": "custom.width",
                      "value": 157
                    }
                  ]
                },
                {
                  "matcher": {
                    "id": "byName",
                    "options": "created_by_kind"
                  },
                  "properties": [
                    {
                      "id": "custom.width",
                      "value": 205
                    }
                  ]
                },
                {
                  "matcher": {
                    "id": "byName",
                    "options": "namespace"
                  },
                  "properties": [
                    {
                      "id": "custom.width",
                      "value": 263
                    }
                  ]
                }
              ]
            },
            "gridPos": {
              "h": 11,
              "w": 12,
              "x": 12,
              "y": 1
            },
            "id": 5,
            "options": {
              "footer": {
                "fields": "",
                "reducer": [
                  "sum"
                ],
                "show": false
              },
              "showHeader": true,
              "sortBy": []
            },
            "pluginVersion": "9.3.8",
            "targets": [
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "$${datasource}"
                },
                "exemplar": true,
                "expr": "kube_pod_info{node=\"$node\"}",
                "format": "table",
                "interval": "",
                "legendFormat": "",
                "refId": "A"
              }
            ],
            "title": "List of pods on node ($node)",
            "transformations": [
              {
                "id": "organize",
                "options": {
                  "excludeByName": {
                    "Time": true,
                    "Value": true,
                    "__name__": true,
                    "container": true,
                    "created_by_kind": false,
                    "created_by_name": true,
                    "endpoint": true,
                    "env": true,
                    "host_ip": true,
                    "host_network": true,
                    "instance": true,
                    "job": true,
                    "node": true,
                    "project": true,
                    "prometheus_replica": true,
                    "service": true,
                    "uid": true
                  },
                  "indexByName": {
                    "Time": 6,
                    "Value": 20,
                    "__name__": 7,
                    "container": 8,
                    "created_by_kind": 2,
                    "created_by_name": 9,
                    "endpoint": 10,
                    "env": 11,
                    "host_ip": 5,
                    "host_network": 12,
                    "instance": 13,
                    "job": 14,
                    "namespace": 1,
                    "node": 15,
                    "pod": 0,
                    "pod_ip": 3,
                    "priority_class": 4,
                    "project": 16,
                    "prometheus_replica": 17,
                    "service": 18,
                    "uid": 19
                  },
                  "renameByName": {}
                }
              },
              {
                "id": "groupBy",
                "options": {
                  "fields": {
                    "created_by_kind": {
                      "aggregations": [],
                      "operation": "groupby"
                    },
                    "host_ip": {
                      "aggregations": [],
                      "operation": "groupby"
                    },
                    "namespace": {
                      "aggregations": [
                        "last"
                      ],
                      "operation": "groupby"
                    },
                    "pod": {
                      "aggregations": [],
                      "operation": "groupby"
                    },
                    "pod_ip": {
                      "aggregations": [],
                      "operation": "groupby"
                    },
                    "priority_class": {
                      "aggregations": [],
                      "operation": "groupby"
                    }
                  }
                }
              }
            ],
            "type": "table"
          },
          {
            "datasource": {
              "type": "prometheus",
              "uid": "$${datasource}"
            },
            "fieldConfig": {
              "defaults": {
                "decimals": 3,
                "mappings": [],
                "noValue": "0",
                "thresholds": {
                  "mode": "absolute",
                  "steps": [
                    {
                      "color": "rgb(255, 255, 255)",
                      "value": null
                    }
                  ]
                },
                "unit": "none"
              },
              "overrides": []
            },
            "gridPos": {
              "h": 3,
              "w": 2,
              "x": 0,
              "y": 9
            },
            "id": 9,
            "options": {
              "colorMode": "none",
              "graphMode": "none",
              "justifyMode": "auto",
              "orientation": "auto",
              "reduceOptions": {
                "calcs": [
                  "mean"
                ],
                "fields": "",
                "values": false
              },
              "text": {},
              "textMode": "auto"
            },
            "pluginVersion": "9.3.8",
            "targets": [
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "$${datasource}"
                },
                "exemplar": false,
                "expr": "sum(1-rate(node_cpu_seconds_total{mode=\"idle\", instance=\"$instance\"}[$__rate_interval]))",
                "instant": true,
                "interval": "$resolution",
                "legendFormat": "",
                "refId": "A"
              }
            ],
            "title": "CPU Used",
            "type": "stat"
          },
          {
            "datasource": {
              "type": "prometheus",
              "uid": "$${datasource}"
            },
            "fieldConfig": {
              "defaults": {
                "mappings": [],
                "noValue": "0",
                "thresholds": {
                  "mode": "absolute",
                  "steps": [
                    {
                      "color": "rgb(255, 255, 255)",
                      "value": null
                    }
                  ]
                },
                "unit": "none"
              },
              "overrides": []
            },
            "gridPos": {
              "h": 3,
              "w": 2,
              "x": 2,
              "y": 9
            },
            "id": 11,
            "options": {
              "colorMode": "none",
              "graphMode": "none",
              "justifyMode": "auto",
              "orientation": "auto",
              "reduceOptions": {
                "calcs": [
                  "mean"
                ],
                "fields": "",
                "values": false
              },
              "text": {},
              "textMode": "auto"
            },
            "pluginVersion": "9.3.8",
            "targets": [
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "$${datasource}"
                },
                "exemplar": true,
                "expr": "sum(machine_cpu_cores{node=\"$node\"})",
                "interval": "$resolution",
                "legendFormat": "",
                "refId": "A"
              }
            ],
            "title": "CPU Total",
            "type": "stat"
          },
          {
            "datasource": {
              "type": "prometheus",
              "uid": "$${datasource}"
            },
            "fieldConfig": {
              "defaults": {
                "mappings": [],
                "noValue": "0",
                "thresholds": {
                  "mode": "absolute",
                  "steps": [
                    {
                      "color": "rgb(255, 255, 255)",
                      "value": null
                    }
                  ]
                },
                "unit": "bytes"
              },
              "overrides": []
            },
            "gridPos": {
              "h": 3,
              "w": 2,
              "x": 4,
              "y": 9
            },
            "id": 15,
            "options": {
              "colorMode": "none",
              "graphMode": "none",
              "justifyMode": "auto",
              "orientation": "auto",
              "reduceOptions": {
                "calcs": [
                  "mean"
                ],
                "fields": "",
                "values": false
              },
              "text": {},
              "textMode": "auto"
            },
            "pluginVersion": "9.3.8",
            "targets": [
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "$${datasource}"
                },
                "exemplar": false,
                "expr": "sum(node_memory_MemTotal_bytes{instance=\"$instance\"} - node_memory_MemAvailable_bytes{instance=\"$instance\"})",
                "instant": true,
                "interval": "",
                "legendFormat": "",
                "refId": "A"
              }
            ],
            "title": "RAM Used",
            "type": "stat"
          },
          {
            "datasource": {
              "type": "prometheus",
              "uid": "$${datasource}"
            },
            "fieldConfig": {
              "defaults": {
                "mappings": [],
                "noValue": "0",
                "thresholds": {
                  "mode": "absolute",
                  "steps": [
                    {
                      "color": "rgb(255, 255, 255)",
                      "value": null
                    }
                  ]
                },
                "unit": "bytes"
              },
              "overrides": []
            },
            "gridPos": {
              "h": 3,
              "w": 2,
              "x": 6,
              "y": 9
            },
            "id": 17,
            "options": {
              "colorMode": "none",
              "graphMode": "none",
              "justifyMode": "auto",
              "orientation": "auto",
              "reduceOptions": {
                "calcs": [
                  "mean"
                ],
                "fields": "",
                "values": false
              },
              "text": {},
              "textMode": "auto"
            },
            "pluginVersion": "9.3.8",
            "targets": [
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "$${datasource}"
                },
                "exemplar": true,
                "expr": "machine_memory_bytes{node=\"$node\"}",
                "instant": false,
                "interval": "",
                "legendFormat": "",
                "refId": "A"
              }
            ],
            "title": "RAM Total",
            "type": "stat"
          },
          {
            "datasource": {
              "type": "prometheus",
              "uid": "$${datasource}"
            },
            "fieldConfig": {
              "defaults": {
                "mappings": [],
                "noValue": "0",
                "thresholds": {
                  "mode": "absolute",
                  "steps": [
                    {
                      "color": "green",
                      "value": null
                    },
                    {
                      "color": "#EAB839",
                      "value": 25228800
                    },
                    {
                      "color": "red",
                      "value": 31536000
                    }
                  ]
                },
                "unit": "s"
              },
              "overrides": []
            },
            "gridPos": {
              "h": 3,
              "w": 4,
              "x": 8,
              "y": 9
            },
            "id": 18,
            "options": {
              "colorMode": "value",
              "graphMode": "none",
              "justifyMode": "auto",
              "orientation": "auto",
              "reduceOptions": {
                "calcs": [
                  "mean"
                ],
                "fields": "",
                "values": false
              },
              "text": {},
              "textMode": "auto"
            },
            "pluginVersion": "9.3.8",
            "targets": [
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "$${datasource}"
                },
                "exemplar": true,
                "expr": "node_time_seconds{instance=\"$instance\"} - node_boot_time_seconds{instance=\"$instance\"}",
                "instant": false,
                "interval": "",
                "legendFormat": "",
                "refId": "A"
              }
            ],
            "title": "uptime",
            "type": "stat"
          },
          {
            "collapsed": false,
            "datasource": {
              "type": "prometheus",
              "uid": "prometheus"
            },
            "gridPos": {
              "h": 1,
              "w": 24,
              "x": 0,
              "y": 12
            },
            "id": 38,
            "panels": [],
            "title": "Resources",
            "type": "row"
          },
          {
            "datasource": {
              "type": "prometheus",
              "uid": "$${datasource}"
            },
            "fieldConfig": {
              "defaults": {
                "color": {
                  "mode": "palette-classic"
                },
                "custom": {
                  "axisCenteredZero": false,
                  "axisColorMode": "text",
                  "axisLabel": "",
                  "axisPlacement": "auto",
                  "barAlignment": 0,
                  "drawStyle": "line",
                  "fillOpacity": 25,
                  "gradientMode": "opacity",
                  "hideFrom": {
                    "legend": false,
                    "tooltip": false,
                    "viz": false
                  },
                  "lineInterpolation": "smooth",
                  "lineStyle": {
                    "fill": "solid"
                  },
                  "lineWidth": 2,
                  "pointSize": 5,
                  "scaleDistribution": {
                    "type": "linear"
                  },
                  "showPoints": "never",
                  "spanNulls": false,
                  "stacking": {
                    "group": "A",
                    "mode": "none"
                  },
                  "thresholdsStyle": {
                    "mode": "off"
                  }
                },
                "mappings": [],
                "max": 100,
                "thresholds": {
                  "mode": "absolute",
                  "steps": [
                    {
                      "color": "green",
                      "value": null
                    },
                    {
                      "color": "red",
                      "value": 80
                    }
                  ]
                },
                "unit": "percent"
              },
              "overrides": []
            },
            "gridPos": {
              "h": 9,
              "w": 12,
              "x": 0,
              "y": 13
            },
            "id": 2,
            "options": {
              "legend": {
                "calcs": [],
                "displayMode": "list",
                "placement": "bottom",
                "showLegend": true
              },
              "tooltip": {
                "mode": "multi",
                "sort": "none"
              }
            },
            "targets": [
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "$${datasource}"
                },
                "exemplar": true,
                "expr": "avg(rate(node_cpu_seconds_total{instance=\"$instance\"}[$__rate_interval]) * 100) by (mode)",
                "hide": false,
                "instant": false,
                "interval": "$resolution",
                "legendFormat": "{{ mode }}",
                "refId": "A"
              }
            ],
            "title": "CPU Usage",
            "type": "timeseries"
          },
          {
            "datasource": {
              "type": "prometheus",
              "uid": "$${datasource}"
            },
            "fieldConfig": {
              "defaults": {
                "color": {
                  "mode": "palette-classic"
                },
                "custom": {
                  "axisCenteredZero": false,
                  "axisColorMode": "text",
                  "axisLabel": "",
                  "axisPlacement": "auto",
                  "barAlignment": 0,
                  "drawStyle": "line",
                  "fillOpacity": 25,
                  "gradientMode": "opacity",
                  "hideFrom": {
                    "legend": false,
                    "tooltip": false,
                    "viz": false
                  },
                  "lineInterpolation": "smooth",
                  "lineStyle": {
                    "fill": "solid"
                  },
                  "lineWidth": 2,
                  "pointSize": 5,
                  "scaleDistribution": {
                    "type": "linear"
                  },
                  "showPoints": "never",
                  "spanNulls": false,
                  "stacking": {
                    "group": "A",
                    "mode": "none"
                  },
                  "thresholdsStyle": {
                    "mode": "off"
                  }
                },
                "mappings": [],
                "thresholds": {
                  "mode": "absolute",
                  "steps": [
                    {
                      "color": "green",
                      "value": null
                    },
                    {
                      "color": "red",
                      "value": 80
                    }
                  ]
                },
                "unit": "bytes"
              },
              "overrides": []
            },
            "gridPos": {
              "h": 9,
              "w": 12,
              "x": 12,
              "y": 13
            },
            "id": 3,
            "options": {
              "legend": {
                "calcs": [],
                "displayMode": "list",
                "placement": "right",
                "showLegend": true
              },
              "tooltip": {
                "mode": "multi",
                "sort": "desc"
              }
            },
            "targets": [
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "$${datasource}"
                },
                "exemplar": true,
                "expr": "node_memory_MemTotal_bytes{instance=\"$instance\"} - node_memory_MemFree_bytes{instance=\"$instance\"} - (node_memory_Cached_bytes{instance=\"$instance\"} + node_memory_Buffers_bytes{instance=\"$instance\"})",
                "instant": false,
                "interval": "$resolution",
                "legendFormat": "RAM Used",
                "refId": "A"
              },
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "$${datasource}"
                },
                "exemplar": true,
                "expr": "node_memory_MemTotal_bytes{instance=\"$instance\"}",
                "hide": false,
                "interval": "$resolution",
                "legendFormat": "RAM Total",
                "refId": "B"
              },
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "$${datasource}"
                },
                "exemplar": true,
                "expr": "node_memory_Cached_bytes{instance=\"$instance\"}",
                "hide": false,
                "interval": "$resolution",
                "legendFormat": "RAM Cache",
                "refId": "C"
              },
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "$${datasource}"
                },
                "exemplar": true,
                "expr": "node_memory_Buffers_bytes{instance=\"$instance\"}",
                "hide": false,
                "interval": "$resolution",
                "legendFormat": "RAM Buffer",
                "refId": "D"
              },
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "$${datasource}"
                },
                "exemplar": true,
                "expr": "node_memory_MemFree_bytes{instance=\"$instance\"}",
                "hide": false,
                "interval": "$resolution",
                "legendFormat": "RAM Free",
                "refId": "E"
              },
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "$${datasource}"
                },
                "exemplar": true,
                "expr": "node_memory_SwapTotal_bytes{instance=\"$instance\"} - node_memory_SwapFree_bytes{instance=\"$instance\"}",
                "hide": false,
                "interval": "$resolution",
                "legendFormat": "SWAP Used",
                "refId": "F"
              },
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "$${datasource}"
                },
                "exemplar": true,
                "expr": "node_memory_SwapTotal_bytes{instance=\"$instance\"}",
                "hide": false,
                "interval": "$resolution",
                "legendFormat": "SWAP Total",
                "refId": "G"
              }
            ],
            "title": "Memory Usage",
            "type": "timeseries"
          },
          {
            "datasource": {
              "type": "prometheus",
              "uid": "$${datasource}"
            },
            "fieldConfig": {
              "defaults": {
                "color": {
                  "mode": "palette-classic"
                },
                "custom": {
                  "axisCenteredZero": false,
                  "axisColorMode": "text",
                  "axisLabel": "CPU Cores",
                  "axisPlacement": "auto",
                  "barAlignment": 0,
                  "drawStyle": "line",
                  "fillOpacity": 25,
                  "gradientMode": "opacity",
                  "hideFrom": {
                    "legend": false,
                    "tooltip": false,
                    "viz": false
                  },
                  "lineInterpolation": "smooth",
                  "lineWidth": 2,
                  "pointSize": 5,
                  "scaleDistribution": {
                    "type": "linear"
                  },
                  "showPoints": "never",
                  "spanNulls": false,
                  "stacking": {
                    "group": "A",
                    "mode": "none"
                  },
                  "thresholdsStyle": {
                    "mode": "off"
                  }
                },
                "mappings": [],
                "thresholds": {
                  "mode": "absolute",
                  "steps": [
                    {
                      "color": "green",
                      "value": null
                    },
                    {
                      "color": "red",
                      "value": 80
                    }
                  ]
                },
                "unit": "none"
              },
              "overrides": []
            },
            "gridPos": {
              "h": 8,
              "w": 12,
              "x": 0,
              "y": 22
            },
            "id": 26,
            "options": {
              "legend": {
                "calcs": [],
                "displayMode": "table",
                "placement": "right",
                "showLegend": true
              },
              "tooltip": {
                "mode": "single",
                "sort": "none"
              }
            },
            "pluginVersion": "8.3.3",
            "targets": [
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "$${datasource}"
                },
                "exemplar": true,
                "expr": "sum(rate(container_cpu_usage_seconds_total{node=\"$node\", image!=\"\"}[$__rate_interval])) by (pod)",
                "interval": "$resolution",
                "legendFormat": "{{ pod }}",
                "refId": "A"
              }
            ],
            "title": "CPU usage by Pod",
            "type": "timeseries"
          },
          {
            "datasource": {
              "type": "prometheus",
              "uid": "$${datasource}"
            },
            "fieldConfig": {
              "defaults": {
                "color": {
                  "mode": "palette-classic"
                },
                "custom": {
                  "axisCenteredZero": false,
                  "axisColorMode": "text",
                  "axisLabel": "",
                  "axisPlacement": "auto",
                  "barAlignment": 0,
                  "drawStyle": "line",
                  "fillOpacity": 25,
                  "gradientMode": "opacity",
                  "hideFrom": {
                    "legend": false,
                    "tooltip": false,
                    "viz": false
                  },
                  "lineInterpolation": "smooth",
                  "lineWidth": 2,
                  "pointSize": 5,
                  "scaleDistribution": {
                    "type": "linear"
                  },
                  "showPoints": "never",
                  "spanNulls": false,
                  "stacking": {
                    "group": "A",
                    "mode": "none"
                  },
                  "thresholdsStyle": {
                    "mode": "off"
                  }
                },
                "mappings": [],
                "thresholds": {
                  "mode": "absolute",
                  "steps": [
                    {
                      "color": "green",
                      "value": null
                    },
                    {
                      "color": "red",
                      "value": 80
                    }
                  ]
                },
                "unit": "bytes"
              },
              "overrides": []
            },
            "gridPos": {
              "h": 8,
              "w": 12,
              "x": 12,
              "y": 22
            },
            "id": 28,
            "options": {
              "legend": {
                "calcs": [],
                "displayMode": "table",
                "placement": "right",
                "showLegend": true
              },
              "tooltip": {
                "mode": "single",
                "sort": "none"
              }
            },
            "pluginVersion": "8.3.3",
            "targets": [
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "$${datasource}"
                },
                "exemplar": true,
                "expr": "sum(container_memory_working_set_bytes{node=\"$node\", image!=\"\"}) by (pod)",
                "interval": "$resolution",
                "legendFormat": "{{ pod }}",
                "refId": "A"
              }
            ],
            "title": "Memory usage by Pod",
            "type": "timeseries"
          },
          {
            "datasource": {
              "type": "prometheus",
              "uid": "$${datasource}"
            },
            "description": "Number of times a CPU core has been throttled on an instance.",
            "fieldConfig": {
              "defaults": {
                "color": {
                  "mode": "palette-classic"
                },
                "custom": {
                  "axisCenteredZero": false,
                  "axisColorMode": "text",
                  "axisLabel": "CPU CORES",
                  "axisPlacement": "auto",
                  "barAlignment": 0,
                  "drawStyle": "line",
                  "fillOpacity": 25,
                  "gradientMode": "opacity",
                  "hideFrom": {
                    "legend": false,
                    "tooltip": false,
                    "viz": false
                  },
                  "lineInterpolation": "smooth",
                  "lineStyle": {
                    "fill": "solid"
                  },
                  "lineWidth": 2,
                  "pointSize": 5,
                  "scaleDistribution": {
                    "type": "linear"
                  },
                  "showPoints": "never",
                  "spanNulls": false,
                  "stacking": {
                    "group": "A",
                    "mode": "none"
                  },
                  "thresholdsStyle": {
                    "mode": "off"
                  }
                },
                "decimals": 2,
                "mappings": [],
                "thresholds": {
                  "mode": "absolute",
                  "steps": [
                    {
                      "color": "green",
                      "value": null
                    },
                    {
                      "color": "red",
                      "value": 80
                    }
                  ]
                },
                "unit": "none"
              },
              "overrides": []
            },
            "gridPos": {
              "h": 8,
              "w": 12,
              "x": 0,
              "y": 30
            },
            "id": 66,
            "options": {
              "legend": {
                "calcs": [
                  "min",
                  "max",
                  "mean"
                ],
                "displayMode": "table",
                "placement": "right",
                "showLegend": true,
                "sortBy": "Max",
                "sortDesc": true
              },
              "tooltip": {
                "mode": "multi",
                "sort": "none"
              }
            },
            "pluginVersion": "8.3.3",
            "targets": [
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "$${datasource}"
                },
                "editorMode": "code",
                "exemplar": true,
                "expr": "sum(rate(node_cpu_core_throttles_total{instance=\"$instance\"}[$__rate_interval]))",
                "interval": "$resolution",
                "legendFormat": "Nb of cpu core throttles",
                "range": true,
                "refId": "A"
              }
            ],
            "title": "Number of CPU Core Throttled",
            "type": "timeseries"
          },
          {
            "collapsed": false,
            "datasource": {
              "type": "prometheus",
              "uid": "prometheus"
            },
            "gridPos": {
              "h": 1,
              "w": 24,
              "x": 0,
              "y": 38
            },
            "id": 44,
            "panels": [],
            "title": "System",
            "type": "row"
          },
          {
            "datasource": {
              "type": "prometheus",
              "uid": "$${datasource}"
            },
            "fieldConfig": {
              "defaults": {
                "color": {
                  "mode": "palette-classic"
                },
                "custom": {
                  "axisCenteredZero": false,
                  "axisColorMode": "text",
                  "axisLabel": "",
                  "axisPlacement": "auto",
                  "barAlignment": 0,
                  "drawStyle": "line",
                  "fillOpacity": 25,
                  "gradientMode": "opacity",
                  "hideFrom": {
                    "legend": false,
                    "tooltip": false,
                    "viz": false
                  },
                  "lineInterpolation": "smooth",
                  "lineStyle": {
                    "fill": "solid"
                  },
                  "lineWidth": 2,
                  "pointSize": 5,
                  "scaleDistribution": {
                    "type": "linear"
                  },
                  "showPoints": "never",
                  "spanNulls": false,
                  "stacking": {
                    "group": "A",
                    "mode": "none"
                  },
                  "thresholdsStyle": {
                    "mode": "off"
                  }
                },
                "mappings": [],
                "thresholds": {
                  "mode": "absolute",
                  "steps": [
                    {
                      "color": "green",
                      "value": null
                    },
                    {
                      "color": "red",
                      "value": 80
                    }
                  ]
                }
              },
              "overrides": []
            },
            "gridPos": {
              "h": 8,
              "w": 12,
              "x": 0,
              "y": 39
            },
            "id": 48,
            "options": {
              "legend": {
                "calcs": [],
                "displayMode": "list",
                "placement": "bottom",
                "showLegend": true
              },
              "tooltip": {
                "mode": "multi",
                "sort": "desc"
              }
            },
            "targets": [
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "$${datasource}"
                },
                "editorMode": "code",
                "exemplar": true,
                "expr": "node_load1{instance=\"$instance\"}",
                "interval": "$resolution",
                "legendFormat": "1m",
                "range": true,
                "refId": "A"
              },
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "$${datasource}"
                },
                "editorMode": "code",
                "exemplar": true,
                "expr": "node_load5{instance=\"$instance\"}",
                "hide": false,
                "interval": "$resolution",
                "legendFormat": "5m",
                "range": true,
                "refId": "B"
              },
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "$${datasource}"
                },
                "editorMode": "code",
                "exemplar": true,
                "expr": "node_load15{instance=\"$instance\"}",
                "hide": false,
                "interval": "$resolution",
                "legendFormat": "15m",
                "range": true,
                "refId": "C"
              }
            ],
            "title": "System Load",
            "type": "timeseries"
          },
          {
            "datasource": {
              "type": "prometheus",
              "uid": "$${datasource}"
            },
            "fieldConfig": {
              "defaults": {
                "color": {
                  "mode": "palette-classic"
                },
                "custom": {
                  "axisCenteredZero": false,
                  "axisColorMode": "text",
                  "axisLabel": "",
                  "axisPlacement": "auto",
                  "barAlignment": 0,
                  "drawStyle": "line",
                  "fillOpacity": 25,
                  "gradientMode": "opacity",
                  "hideFrom": {
                    "legend": false,
                    "tooltip": false,
                    "viz": false
                  },
                  "lineInterpolation": "smooth",
                  "lineWidth": 2,
                  "pointSize": 5,
                  "scaleDistribution": {
                    "type": "linear"
                  },
                  "showPoints": "never",
                  "spanNulls": false,
                  "stacking": {
                    "group": "A",
                    "mode": "none"
                  },
                  "thresholdsStyle": {
                    "mode": "off"
                  }
                },
                "mappings": [],
                "thresholds": {
                  "mode": "absolute",
                  "steps": [
                    {
                      "color": "green",
                      "value": null
                    },
                    {
                      "color": "red",
                      "value": 80
                    }
                  ]
                }
              },
              "overrides": []
            },
            "gridPos": {
              "h": 8,
              "w": 12,
              "x": 12,
              "y": 39
            },
            "id": 46,
            "options": {
              "legend": {
                "calcs": [],
                "displayMode": "list",
                "placement": "bottom",
                "showLegend": true
              },
              "tooltip": {
                "mode": "multi",
                "sort": "desc"
              }
            },
            "targets": [
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "$${datasource}"
                },
                "editorMode": "code",
                "exemplar": true,
                "expr": "rate(node_context_switches_total{instance=\"$instance\"}[$__rate_interval])",
                "interval": "$resolution",
                "intervalFactor": 1,
                "legendFormat": "Context switches",
                "range": true,
                "refId": "A"
              },
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "$${datasource}"
                },
                "editorMode": "code",
                "exemplar": true,
                "expr": "rate(node_intr_total{instance=\"$instance\"}[$__rate_interval])",
                "hide": false,
                "interval": "$resolution",
                "legendFormat": "Interrupts",
                "range": true,
                "refId": "B"
              }
            ],
            "title": "Context Switches & Interrupts",
            "type": "timeseries"
          },
          {
            "datasource": {
              "type": "prometheus",
              "uid": "$${datasource}"
            },
            "fieldConfig": {
              "defaults": {
                "color": {
                  "mode": "palette-classic"
                },
                "custom": {
                  "axisCenteredZero": false,
                  "axisColorMode": "text",
                  "axisLabel": "",
                  "axisPlacement": "auto",
                  "barAlignment": 0,
                  "drawStyle": "line",
                  "fillOpacity": 25,
                  "gradientMode": "opacity",
                  "hideFrom": {
                    "legend": false,
                    "tooltip": false,
                    "viz": false
                  },
                  "lineInterpolation": "smooth",
                  "lineStyle": {
                    "fill": "solid"
                  },
                  "lineWidth": 2,
                  "pointSize": 5,
                  "scaleDistribution": {
                    "type": "linear"
                  },
                  "showPoints": "never",
                  "spanNulls": false,
                  "stacking": {
                    "group": "A",
                    "mode": "none"
                  },
                  "thresholdsStyle": {
                    "mode": "off"
                  }
                },
                "mappings": [],
                "thresholds": {
                  "mode": "absolute",
                  "steps": [
                    {
                      "color": "green",
                      "value": null
                    },
                    {
                      "color": "red",
                      "value": 80
                    }
                  ]
                }
              },
              "overrides": []
            },
            "gridPos": {
              "h": 8,
              "w": 12,
              "x": 0,
              "y": 47
            },
            "id": 49,
            "options": {
              "legend": {
                "calcs": [],
                "displayMode": "list",
                "placement": "bottom",
                "showLegend": true
              },
              "tooltip": {
                "mode": "multi",
                "sort": "none"
              }
            },
            "targets": [
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "$${datasource}"
                },
                "editorMode": "code",
                "exemplar": true,
                "expr": "node_filefd_maximum{instance=\"$instance\"}",
                "instant": false,
                "interval": "$resolution",
                "legendFormat": "Maximum file descriptors",
                "refId": "A"
              },
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "$${datasource}"
                },
                "editorMode": "code",
                "exemplar": true,
                "expr": "node_filefd_allocated{instance=\"$instance\"}",
                "hide": false,
                "instant": false,
                "interval": "$resolution",
                "legendFormat": "Allocated file descriptors",
                "refId": "B"
              }
            ],
            "title": "File Descriptors",
            "type": "timeseries"
          },
          {
            "datasource": {
              "type": "prometheus",
              "uid": "$${datasource}"
            },
            "fieldConfig": {
              "defaults": {
                "color": {
                  "mode": "palette-classic"
                },
                "custom": {
                  "axisCenteredZero": false,
                  "axisColorMode": "text",
                  "axisLabel": "",
                  "axisPlacement": "auto",
                  "barAlignment": 0,
                  "drawStyle": "line",
                  "fillOpacity": 25,
                  "gradientMode": "opacity",
                  "hideFrom": {
                    "legend": false,
                    "tooltip": false,
                    "viz": false
                  },
                  "lineInterpolation": "smooth",
                  "lineStyle": {
                    "fill": "solid"
                  },
                  "lineWidth": 2,
                  "pointSize": 5,
                  "scaleDistribution": {
                    "type": "linear"
                  },
                  "showPoints": "never",
                  "spanNulls": false,
                  "stacking": {
                    "group": "A",
                    "mode": "none"
                  },
                  "thresholdsStyle": {
                    "mode": "off"
                  }
                },
                "mappings": [],
                "thresholds": {
                  "mode": "absolute",
                  "steps": [
                    {
                      "color": "green",
                      "value": null
                    },
                    {
                      "color": "red",
                      "value": 80
                    }
                  ]
                },
                "unit": "s"
              },
              "overrides": []
            },
            "gridPos": {
              "h": 8,
              "w": 12,
              "x": 12,
              "y": 47
            },
            "id": 50,
            "options": {
              "legend": {
                "calcs": [],
                "displayMode": "list",
                "placement": "bottom",
                "showLegend": true
              },
              "tooltip": {
                "mode": "multi",
                "sort": "desc"
              }
            },
            "targets": [
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "$${datasource}"
                },
                "editorMode": "code",
                "exemplar": true,
                "expr": "node_timex_estimated_error_seconds{instance=\"$instance\"}",
                "instant": false,
                "interval": "$resolution",
                "intervalFactor": 1,
                "legendFormat": "Estimated error in seconds",
                "refId": "A"
              },
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "$${datasource}"
                },
                "editorMode": "code",
                "exemplar": true,
                "expr": "node_timex_maxerror_seconds{instance=\"$instance\"}",
                "hide": false,
                "interval": "$resolution",
                "intervalFactor": 1,
                "legendFormat": "Maximum error in seconds",
                "range": true,
                "refId": "B"
              }
            ],
            "title": "Time Sync",
            "type": "timeseries"
          },
          {
            "collapsed": false,
            "datasource": {
              "type": "prometheus",
              "uid": "prometheus"
            },
            "gridPos": {
              "h": 1,
              "w": 24,
              "x": 0,
              "y": 55
            },
            "id": 36,
            "panels": [],
            "title": "Network",
            "type": "row"
          },
          {
            "datasource": {
              "type": "prometheus",
              "uid": "$${datasource}"
            },
            "fieldConfig": {
              "defaults": {
                "color": {
                  "mode": "palette-classic"
                },
                "custom": {
                  "axisCenteredZero": false,
                  "axisColorMode": "text",
                  "axisLabel": "BANDWIDTH",
                  "axisPlacement": "auto",
                  "barAlignment": 0,
                  "drawStyle": "line",
                  "fillOpacity": 25,
                  "gradientMode": "opacity",
                  "hideFrom": {
                    "legend": false,
                    "tooltip": false,
                    "viz": false
                  },
                  "lineInterpolation": "linear",
                  "lineWidth": 2,
                  "pointSize": 5,
                  "scaleDistribution": {
                    "type": "linear"
                  },
                  "showPoints": "never",
                  "spanNulls": false,
                  "stacking": {
                    "group": "A",
                    "mode": "none"
                  },
                  "thresholdsStyle": {
                    "mode": "off"
                  }
                },
                "mappings": [],
                "thresholds": {
                  "mode": "absolute",
                  "steps": [
                    {
                      "color": "green",
                      "value": null
                    },
                    {
                      "color": "red",
                      "value": 80
                    }
                  ]
                },
                "unit": "bytes"
              },
              "overrides": []
            },
            "gridPos": {
              "h": 8,
              "w": 12,
              "x": 0,
              "y": 56
            },
            "id": 20,
            "options": {
              "legend": {
                "calcs": [],
                "displayMode": "list",
                "placement": "bottom",
                "showLegend": false
              },
              "tooltip": {
                "mode": "multi",
                "sort": "none"
              }
            },
            "pluginVersion": "8.3.3",
            "targets": [
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "$${datasource}"
                },
                "editorMode": "code",
                "exemplar": true,
                "expr": "sum(rate(node_network_receive_bytes_total{instance=\"$instance\"}[$__rate_interval]))",
                "interval": "$resolution",
                "legendFormat": "In",
                "range": true,
                "refId": "A"
              },
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "$${datasource}"
                },
                "editorMode": "code",
                "exemplar": true,
                "expr": "- sum(rate(node_network_transmit_bytes_total{instance=\"$instance\"}[$__rate_interval]))",
                "interval": "$resolution",
                "legendFormat": "Out",
                "range": true,
                "refId": "B"
              }
            ],
            "title": "Network usage (bytes)",
            "type": "timeseries"
          },
          {
            "datasource": {
              "type": "prometheus",
              "uid": "$${datasource}"
            },
            "fieldConfig": {
              "defaults": {
                "color": {
                  "mode": "palette-classic"
                },
                "custom": {
                  "axisCenteredZero": false,
                  "axisColorMode": "text",
                  "axisLabel": "",
                  "axisPlacement": "auto",
                  "barAlignment": 0,
                  "drawStyle": "line",
                  "fillOpacity": 25,
                  "gradientMode": "opacity",
                  "hideFrom": {
                    "legend": false,
                    "tooltip": false,
                    "viz": false
                  },
                  "lineInterpolation": "smooth",
                  "lineWidth": 2,
                  "pointSize": 5,
                  "scaleDistribution": {
                    "type": "linear"
                  },
                  "showPoints": "never",
                  "spanNulls": false,
                  "stacking": {
                    "group": "A",
                    "mode": "none"
                  },
                  "thresholdsStyle": {
                    "mode": "off"
                  }
                },
                "mappings": [],
                "thresholds": {
                  "mode": "absolute",
                  "steps": [
                    {
                      "color": "green",
                      "value": null
                    },
                    {
                      "color": "red",
                      "value": 80
                    }
                  ]
                },
                "unit": "none"
              },
              "overrides": []
            },
            "gridPos": {
              "h": 8,
              "w": 12,
              "x": 12,
              "y": 56
            },
            "id": 61,
            "options": {
              "legend": {
                "calcs": [],
                "displayMode": "list",
                "placement": "bottom",
                "showLegend": false
              },
              "tooltip": {
                "mode": "multi",
                "sort": "none"
              }
            },
            "pluginVersion": "8.3.3",
            "targets": [
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "$${datasource}"
                },
                "exemplar": true,
                "expr": "sum(rate(node_network_receive_errs_total{instance=\"$instance\"}[$__rate_interval]))",
                "interval": "$resolution",
                "legendFormat": "In",
                "refId": "A"
              },
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "$${datasource}"
                },
                "editorMode": "code",
                "exemplar": true,
                "expr": "- sum(rate(node_network_transmit_errs_total{instance=\"$instance\"}[$__rate_interval]))",
                "interval": "$resolution",
                "legendFormat": "Out",
                "range": true,
                "refId": "B"
              }
            ],
            "title": "Network errors",
            "type": "timeseries"
          },
          {
            "datasource": {
              "type": "prometheus",
              "uid": "$${datasource}"
            },
            "fieldConfig": {
              "defaults": {
                "color": {
                  "mode": "palette-classic"
                },
                "custom": {
                  "axisCenteredZero": false,
                  "axisColorMode": "text",
                  "axisLabel": "",
                  "axisPlacement": "auto",
                  "barAlignment": 0,
                  "drawStyle": "line",
                  "fillOpacity": 25,
                  "gradientMode": "opacity",
                  "hideFrom": {
                    "legend": false,
                    "tooltip": false,
                    "viz": false
                  },
                  "lineInterpolation": "smooth",
                  "lineWidth": 2,
                  "pointSize": 5,
                  "scaleDistribution": {
                    "type": "linear"
                  },
                  "showPoints": "never",
                  "spanNulls": false,
                  "stacking": {
                    "group": "A",
                    "mode": "none"
                  },
                  "thresholdsStyle": {
                    "mode": "off"
                  }
                },
                "mappings": [],
                "thresholds": {
                  "mode": "absolute",
                  "steps": [
                    {
                      "color": "green",
                      "value": null
                    },
                    {
                      "color": "red",
                      "value": 80
                    }
                  ]
                },
                "unit": "pps"
              },
              "overrides": []
            },
            "gridPos": {
              "h": 8,
              "w": 12,
              "x": 0,
              "y": 64
            },
            "id": 62,
            "options": {
              "legend": {
                "calcs": [],
                "displayMode": "list",
                "placement": "bottom",
                "showLegend": false
              },
              "tooltip": {
                "mode": "multi",
                "sort": "none"
              }
            },
            "pluginVersion": "8.3.3",
            "targets": [
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "$${datasource}"
                },
                "editorMode": "code",
                "exemplar": true,
                "expr": "sum(rate(node_network_receive_packets_total{instance=\"$instance\"}[$__rate_interval]))",
                "interval": "$resolution",
                "legendFormat": "In",
                "range": true,
                "refId": "A"
              },
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "$${datasource}"
                },
                "editorMode": "code",
                "exemplar": true,
                "expr": "- sum(rate(node_network_transmit_packets_total{instance=\"$instance\"}[$__rate_interval]))",
                "interval": "$resolution",
                "legendFormat": "Out",
                "range": true,
                "refId": "B"
              }
            ],
            "title": "Network usage (packet/s)",
            "type": "timeseries"
          },
          {
            "datasource": {
              "type": "prometheus",
              "uid": "$${datasource}"
            },
            "fieldConfig": {
              "defaults": {
                "color": {
                  "mode": "palette-classic"
                },
                "custom": {
                  "axisCenteredZero": false,
                  "axisColorMode": "text",
                  "axisLabel": "",
                  "axisPlacement": "auto",
                  "barAlignment": 0,
                  "drawStyle": "line",
                  "fillOpacity": 25,
                  "gradientMode": "opacity",
                  "hideFrom": {
                    "legend": false,
                    "tooltip": false,
                    "viz": false
                  },
                  "lineInterpolation": "smooth",
                  "lineWidth": 2,
                  "pointSize": 5,
                  "scaleDistribution": {
                    "type": "linear"
                  },
                  "showPoints": "never",
                  "spanNulls": false,
                  "stacking": {
                    "group": "A",
                    "mode": "none"
                  },
                  "thresholdsStyle": {
                    "mode": "off"
                  }
                },
                "mappings": [],
                "thresholds": {
                  "mode": "absolute",
                  "steps": [
                    {
                      "color": "green",
                      "value": null
                    },
                    {
                      "color": "red",
                      "value": 80
                    }
                  ]
                },
                "unit": "none"
              },
              "overrides": []
            },
            "gridPos": {
              "h": 8,
              "w": 12,
              "x": 12,
              "y": 64
            },
            "id": 64,
            "options": {
              "legend": {
                "calcs": [],
                "displayMode": "list",
                "placement": "bottom",
                "showLegend": false
              },
              "tooltip": {
                "mode": "multi",
                "sort": "none"
              }
            },
            "pluginVersion": "8.3.3",
            "targets": [
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "$${datasource}"
                },
                "exemplar": true,
                "expr": "sum(rate(node_network_receive_drop_total{instance=\"$instance\"}[$__rate_interval]))",
                "hide": false,
                "interval": "$resolution",
                "legendFormat": "In",
                "refId": "A"
              },
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "$${datasource}"
                },
                "exemplar": true,
                "expr": "- sum(rate(node_network_transmit_drop_total{instance=\"$instance\"}[$__rate_interval]))",
                "hide": false,
                "interval": "$resolution",
                "legendFormat": "Out",
                "refId": "B"
              }
            ],
            "title": "Network total drops",
            "type": "timeseries"
          },
          {
            "datasource": {
              "type": "prometheus",
              "uid": "$${datasource}"
            },
            "fieldConfig": {
              "defaults": {
                "color": {
                  "mode": "palette-classic"
                },
                "custom": {
                  "axisCenteredZero": false,
                  "axisColorMode": "text",
                  "axisLabel": "",
                  "axisPlacement": "auto",
                  "barAlignment": 0,
                  "drawStyle": "line",
                  "fillOpacity": 25,
                  "gradientMode": "opacity",
                  "hideFrom": {
                    "legend": false,
                    "tooltip": false,
                    "viz": false
                  },
                  "lineInterpolation": "smooth",
                  "lineWidth": 2,
                  "pointSize": 5,
                  "scaleDistribution": {
                    "type": "linear"
                  },
                  "showPoints": "never",
                  "spanNulls": false,
                  "stacking": {
                    "group": "A",
                    "mode": "none"
                  },
                  "thresholdsStyle": {
                    "mode": "off"
                  }
                },
                "mappings": [],
                "thresholds": {
                  "mode": "absolute",
                  "steps": [
                    {
                      "color": "green",
                      "value": null
                    },
                    {
                      "color": "red",
                      "value": 80
                    }
                  ]
                },
                "unit": "none"
              },
              "overrides": []
            },
            "gridPos": {
              "h": 8,
              "w": 12,
              "x": 0,
              "y": 72
            },
            "id": 60,
            "options": {
              "legend": {
                "calcs": [],
                "displayMode": "list",
                "placement": "bottom",
                "showLegend": false
              },
              "tooltip": {
                "mode": "multi",
                "sort": "none"
              }
            },
            "pluginVersion": "8.3.3",
            "targets": [
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "$${datasource}"
                },
                "editorMode": "code",
                "exemplar": true,
                "expr": "node_netstat_Tcp_CurrEstab{instance=\"$instance\"}",
                "instant": false,
                "interval": "$resolution",
                "legendFormat": "TCP Currently Established",
                "refId": "A"
              }
            ],
            "title": "TCP Currently Established",
            "type": "timeseries"
          },
          {
            "datasource": {
              "type": "prometheus",
              "uid": "$${datasource}"
            },
            "fieldConfig": {
              "defaults": {
                "color": {
                  "mode": "palette-classic"
                },
                "custom": {
                  "axisCenteredZero": false,
                  "axisColorMode": "text",
                  "axisLabel": "",
                  "axisPlacement": "auto",
                  "barAlignment": 0,
                  "drawStyle": "line",
                  "fillOpacity": 25,
                  "gradientMode": "opacity",
                  "hideFrom": {
                    "legend": false,
                    "tooltip": false,
                    "viz": false
                  },
                  "lineInterpolation": "smooth",
                  "lineWidth": 2,
                  "pointSize": 5,
                  "scaleDistribution": {
                    "type": "linear"
                  },
                  "showPoints": "never",
                  "spanNulls": false,
                  "stacking": {
                    "group": "A",
                    "mode": "none"
                  },
                  "thresholdsStyle": {
                    "mode": "off"
                  }
                },
                "mappings": [],
                "thresholds": {
                  "mode": "absolute",
                  "steps": [
                    {
                      "color": "green",
                      "value": null
                    },
                    {
                      "color": "red",
                      "value": 80
                    }
                  ]
                },
                "unit": "none"
              },
              "overrides": [
                {
                  "matcher": {
                    "id": "byName",
                    "options": "NF Conntrack limit"
                  },
                  "properties": [
                    {
                      "id": "color",
                      "value": {
                        "fixedColor": "red",
                        "mode": "fixed"
                      }
                    }
                  ]
                }
              ]
            },
            "gridPos": {
              "h": 8,
              "w": 12,
              "x": 12,
              "y": 72
            },
            "id": 63,
            "options": {
              "legend": {
                "calcs": [],
                "displayMode": "list",
                "placement": "bottom",
                "showLegend": false
              },
              "tooltip": {
                "mode": "multi",
                "sort": "none"
              }
            },
            "pluginVersion": "8.3.3",
            "targets": [
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "$${datasource}"
                },
                "editorMode": "code",
                "exemplar": true,
                "expr": "node_nf_conntrack_entries{instance=\"$instance\"}",
                "instant": false,
                "interval": "$resolution",
                "legendFormat": "NF Conntrack entries",
                "refId": "A"
              },
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "$${datasource}"
                },
                "editorMode": "code",
                "exemplar": true,
                "expr": "node_nf_conntrack_entries_limit{instance=\"$instance\"}",
                "hide": false,
                "interval": "$resolution",
                "legendFormat": "NF Conntrack limit",
                "range": true,
                "refId": "B"
              }
            ],
            "title": "NF Conntrack",
            "type": "timeseries"
          },
          {
            "collapsed": false,
            "datasource": {
              "type": "prometheus",
              "uid": "prometheus"
            },
            "gridPos": {
              "h": 1,
              "w": 24,
              "x": 0,
              "y": 80
            },
            "id": 54,
            "panels": [],
            "title": "Kubernetes Storage",
            "type": "row"
          },
          {
            "datasource": {
              "type": "prometheus",
              "uid": "$${datasource}"
            },
            "fieldConfig": {
              "defaults": {
                "color": {
                  "mode": "palette-classic"
                },
                "custom": {
                  "axisCenteredZero": false,
                  "axisColorMode": "text",
                  "axisLabel": "",
                  "axisPlacement": "auto",
                  "barAlignment": 0,
                  "drawStyle": "line",
                  "fillOpacity": 25,
                  "gradientMode": "opacity",
                  "hideFrom": {
                    "legend": false,
                    "tooltip": false,
                    "viz": false
                  },
                  "lineInterpolation": "smooth",
                  "lineWidth": 2,
                  "pointSize": 5,
                  "scaleDistribution": {
                    "type": "linear"
                  },
                  "showPoints": "never",
                  "spanNulls": false,
                  "stacking": {
                    "group": "A",
                    "mode": "none"
                  },
                  "thresholdsStyle": {
                    "mode": "off"
                  }
                },
                "decimals": 2,
                "mappings": [],
                "thresholds": {
                  "mode": "absolute",
                  "steps": [
                    {
                      "color": "green",
                      "value": null
                    },
                    {
                      "color": "red",
                      "value": 80
                    }
                  ]
                },
                "unit": "percentunit"
              },
              "overrides": []
            },
            "gridPos": {
              "h": 8,
              "w": 12,
              "x": 0,
              "y": 81
            },
            "id": 30,
            "options": {
              "legend": {
                "calcs": [],
                "displayMode": "list",
                "placement": "right",
                "showLegend": false
              },
              "tooltip": {
                "mode": "multi",
                "sort": "desc"
              }
            },
            "pluginVersion": "8.3.3",
            "targets": [
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "$${datasource}"
                },
                "editorMode": "code",
                "exemplar": true,
                "expr": "sum(kubelet_volume_stats_used_bytes{node=\"$node\"}) by (persistentvolumeclaim) / sum(kubelet_volume_stats_capacity_bytes{node=\"$node\"}) by (persistentvolumeclaim)",
                "interval": "$resolution",
                "legendFormat": "{{ persistentvolumeclaim }}",
                "range": true,
                "refId": "A"
              }
            ],
            "title": "Persistent Volumes - Usage in %",
            "type": "timeseries"
          },
          {
            "datasource": {
              "type": "prometheus",
              "uid": "$${datasource}"
            },
            "fieldConfig": {
              "defaults": {
                "color": {
                  "mode": "continuous-GrYlRd"
                },
                "custom": {
                  "align": "auto",
                  "displayMode": "auto",
                  "filterable": false,
                  "inspect": false
                },
                "mappings": [],
                "thresholds": {
                  "mode": "absolute",
                  "steps": [
                    {
                      "color": "green",
                      "value": null
                    },
                    {
                      "color": "red",
                      "value": 80
                    }
                  ]
                },
                "unit": "bytes"
              },
              "overrides": [
                {
                  "matcher": {
                    "id": "byName",
                    "options": "Used"
                  },
                  "properties": [
                    {
                      "id": "custom.width",
                      "value": 146
                    }
                  ]
                },
                {
                  "matcher": {
                    "id": "byName",
                    "options": "Total"
                  },
                  "properties": [
                    {
                      "id": "custom.width",
                      "value": 167
                    }
                  ]
                }
              ]
            },
            "gridPos": {
              "h": 16,
              "w": 12,
              "x": 12,
              "y": 81
            },
            "id": 34,
            "options": {
              "footer": {
                "fields": "",
                "reducer": [
                  "sum"
                ],
                "show": false
              },
              "showHeader": true,
              "sortBy": []
            },
            "pluginVersion": "9.3.8",
            "targets": [
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "$${datasource}"
                },
                "exemplar": true,
                "expr": "sum(kubelet_volume_stats_used_bytes{node=\"$node\"}) by (persistentvolumeclaim)",
                "format": "table",
                "hide": false,
                "interval": "",
                "legendFormat": "",
                "refId": "A"
              },
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "$${datasource}"
                },
                "exemplar": true,
                "expr": "sum(kubelet_volume_stats_capacity_bytes{node=\"$node\"}) by (persistentvolumeclaim) ",
                "format": "table",
                "hide": false,
                "interval": "",
                "legendFormat": "",
                "refId": "B"
              }
            ],
            "title": "Persistent Volumes - Usage in GB",
            "transformations": [
              {
                "id": "groupBy",
                "options": {
                  "fields": {
                    "Value": {
                      "aggregations": [
                        "lastNotNull"
                      ],
                      "operation": "aggregate"
                    },
                    "Value #A": {
                      "aggregations": [
                        "lastNotNull"
                      ],
                      "operation": "aggregate"
                    },
                    "Value #B": {
                      "aggregations": [
                        "lastNotNull"
                      ],
                      "operation": "aggregate"
                    },
                    "persistentvolumeclaim": {
                      "aggregations": [],
                      "operation": "groupby"
                    }
                  }
                }
              },
              {
                "id": "seriesToColumns",
                "options": {
                  "byField": "persistentvolumeclaim"
                }
              },
              {
                "id": "organize",
                "options": {
                  "excludeByName": {},
                  "indexByName": {},
                  "renameByName": {
                    "Value #A (lastNotNull)": "Used",
                    "Value #B (lastNotNull)": "Total",
                    "persistentvolumeclaim": "Persistent Volume Claim"
                  }
                }
              }
            ],
            "type": "table"
          },
          {
            "datasource": {
              "type": "prometheus",
              "uid": "$${datasource}"
            },
            "fieldConfig": {
              "defaults": {
                "color": {
                  "mode": "palette-classic"
                },
                "custom": {
                  "axisCenteredZero": false,
                  "axisColorMode": "text",
                  "axisLabel": "",
                  "axisPlacement": "auto",
                  "barAlignment": 0,
                  "drawStyle": "line",
                  "fillOpacity": 25,
                  "gradientMode": "opacity",
                  "hideFrom": {
                    "legend": false,
                    "tooltip": false,
                    "viz": false
                  },
                  "lineInterpolation": "smooth",
                  "lineWidth": 2,
                  "pointSize": 5,
                  "scaleDistribution": {
                    "type": "linear"
                  },
                  "showPoints": "never",
                  "spanNulls": false,
                  "stacking": {
                    "group": "A",
                    "mode": "none"
                  },
                  "thresholdsStyle": {
                    "mode": "off"
                  }
                },
                "decimals": 2,
                "mappings": [],
                "thresholds": {
                  "mode": "absolute",
                  "steps": [
                    {
                      "color": "green",
                      "value": null
                    },
                    {
                      "color": "red",
                      "value": 80
                    }
                  ]
                },
                "unit": "percent"
              },
              "overrides": []
            },
            "gridPos": {
              "h": 8,
              "w": 12,
              "x": 0,
              "y": 89
            },
            "id": 32,
            "options": {
              "legend": {
                "calcs": [],
                "displayMode": "list",
                "placement": "bottom",
                "showLegend": false
              },
              "tooltip": {
                "mode": "multi",
                "sort": "desc"
              }
            },
            "pluginVersion": "8.3.3",
            "targets": [
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "$${datasource}"
                },
                "editorMode": "code",
                "exemplar": true,
                "expr": "sum(kubelet_volume_stats_inodes_used{node=\"$node\"}) by (persistentvolumeclaim) / sum(kubelet_volume_stats_inodes{node=\"$node\"}) by (persistentvolumeclaim) * 100",
                "interval": "$resolution",
                "legendFormat": "{{ persistentvolumeclaim }}",
                "range": true,
                "refId": "A"
              }
            ],
            "title": "Persistent Volumes - Inodes",
            "type": "timeseries"
          },
          {
            "collapsed": false,
            "datasource": {
              "type": "prometheus",
              "uid": "prometheus"
            },
            "gridPos": {
              "h": 1,
              "w": 24,
              "x": 0,
              "y": 97
            },
            "id": 42,
            "panels": [],
            "title": "Node Storage",
            "type": "row"
          },
          {
            "datasource": {
              "type": "prometheus",
              "uid": "$${datasource}"
            },
            "fieldConfig": {
              "defaults": {
                "color": {
                  "mode": "palette-classic"
                },
                "custom": {
                  "axisCenteredZero": false,
                  "axisColorMode": "text",
                  "axisLabel": "",
                  "axisPlacement": "auto",
                  "barAlignment": 0,
                  "drawStyle": "line",
                  "fillOpacity": 25,
                  "gradientMode": "opacity",
                  "hideFrom": {
                    "legend": false,
                    "tooltip": false,
                    "viz": false
                  },
                  "lineInterpolation": "smooth",
                  "lineWidth": 2,
                  "pointSize": 5,
                  "scaleDistribution": {
                    "type": "linear"
                  },
                  "showPoints": "never",
                  "spanNulls": false,
                  "stacking": {
                    "group": "A",
                    "mode": "none"
                  },
                  "thresholdsStyle": {
                    "mode": "off"
                  }
                },
                "decimals": 2,
                "mappings": [],
                "thresholds": {
                  "mode": "absolute",
                  "steps": [
                    {
                      "color": "green",
                      "value": null
                    },
                    {
                      "color": "red",
                      "value": 80
                    }
                  ]
                },
                "unit": "percent"
              },
              "overrides": []
            },
            "gridPos": {
              "h": 8,
              "w": 12,
              "x": 0,
              "y": 98
            },
            "id": 33,
            "options": {
              "legend": {
                "calcs": [],
                "displayMode": "list",
                "placement": "right",
                "showLegend": false
              },
              "tooltip": {
                "mode": "multi",
                "sort": "desc"
              }
            },
            "pluginVersion": "8.3.3",
            "targets": [
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "$${datasource}"
                },
                "editorMode": "code",
                "exemplar": true,
                "expr": "100 - ((node_filesystem_avail_bytes{instance=\"$instance\"} * 100) / node_filesystem_size_bytes{instance=\"$instance\"})",
                "hide": false,
                "interval": "$resolution",
                "legendFormat": "{{ mountpoint }}",
                "range": true,
                "refId": "A"
              }
            ],
            "title": "FS usage in %",
            "type": "timeseries"
          },
          {
            "datasource": {
              "type": "prometheus",
              "uid": "$${datasource}"
            },
            "fieldConfig": {
              "defaults": {
                "color": {
                  "mode": "palette-classic"
                },
                "custom": {
                  "axisCenteredZero": false,
                  "axisColorMode": "text",
                  "axisLabel": "",
                  "axisPlacement": "auto",
                  "barAlignment": 0,
                  "drawStyle": "line",
                  "fillOpacity": 25,
                  "gradientMode": "opacity",
                  "hideFrom": {
                    "legend": false,
                    "tooltip": false,
                    "viz": false
                  },
                  "lineInterpolation": "smooth",
                  "lineWidth": 2,
                  "pointSize": 5,
                  "scaleDistribution": {
                    "type": "linear"
                  },
                  "showPoints": "never",
                  "spanNulls": false,
                  "stacking": {
                    "group": "A",
                    "mode": "none"
                  },
                  "thresholdsStyle": {
                    "mode": "off"
                  }
                },
                "decimals": 2,
                "mappings": [],
                "thresholds": {
                  "mode": "absolute",
                  "steps": [
                    {
                      "color": "green",
                      "value": null
                    },
                    {
                      "color": "red",
                      "value": 80
                    }
                  ]
                },
                "unit": "percent"
              },
              "overrides": []
            },
            "gridPos": {
              "h": 8,
              "w": 12,
              "x": 12,
              "y": 98
            },
            "id": 59,
            "options": {
              "legend": {
                "calcs": [],
                "displayMode": "list",
                "placement": "right",
                "showLegend": false
              },
              "tooltip": {
                "mode": "multi",
                "sort": "desc"
              }
            },
            "pluginVersion": "8.3.3",
            "targets": [
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "$${datasource}"
                },
                "editorMode": "code",
                "exemplar": true,
                "expr": "100 - (node_filesystem_files_free{instance=\"$instance\"} / node_filesystem_files{instance=\"$instance\"} * 100)",
                "hide": false,
                "interval": "$resolution",
                "legendFormat": "{{ mountpoint }}",
                "range": true,
                "refId": "A"
              }
            ],
            "title": "FS inode usage in %",
            "type": "timeseries"
          },
          {
            "datasource": {
              "type": "prometheus",
              "uid": "$${datasource}"
            },
            "fieldConfig": {
              "defaults": {
                "color": {
                  "mode": "palette-classic"
                },
                "custom": {
                  "axisCenteredZero": false,
                  "axisColorMode": "text",
                  "axisLabel": "",
                  "axisPlacement": "auto",
                  "barAlignment": 0,
                  "drawStyle": "line",
                  "fillOpacity": 25,
                  "gradientMode": "opacity",
                  "hideFrom": {
                    "legend": false,
                    "tooltip": false,
                    "viz": false
                  },
                  "lineInterpolation": "smooth",
                  "lineWidth": 2,
                  "pointSize": 5,
                  "scaleDistribution": {
                    "type": "linear"
                  },
                  "showPoints": "never",
                  "spanNulls": false,
                  "stacking": {
                    "group": "A",
                    "mode": "none"
                  },
                  "thresholdsStyle": {
                    "mode": "off"
                  }
                },
                "decimals": 2,
                "mappings": [],
                "thresholds": {
                  "mode": "absolute",
                  "steps": [
                    {
                      "color": "green",
                      "value": null
                    },
                    {
                      "color": "red",
                      "value": 80
                    }
                  ]
                },
                "unit": "bytes"
              },
              "overrides": []
            },
            "gridPos": {
              "h": 8,
              "w": 12,
              "x": 0,
              "y": 106
            },
            "id": 52,
            "options": {
              "legend": {
                "calcs": [],
                "displayMode": "list",
                "placement": "right",
                "showLegend": false
              },
              "tooltip": {
                "mode": "multi",
                "sort": "desc"
              }
            },
            "pluginVersion": "8.3.3",
            "targets": [
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "$${datasource}"
                },
                "editorMode": "code",
                "exemplar": true,
                "expr": "rate(node_disk_read_bytes_total{instance=\"$instance\"}[$__rate_interval])",
                "interval": "$resolution",
                "legendFormat": "{{device}}",
                "range": true,
                "refId": "A"
              }
            ],
            "title": "Reads by disk (bytes)",
            "type": "timeseries"
          },
          {
            "datasource": {
              "type": "prometheus",
              "uid": "$${datasource}"
            },
            "fieldConfig": {
              "defaults": {
                "color": {
                  "mode": "palette-classic"
                },
                "custom": {
                  "axisCenteredZero": false,
                  "axisColorMode": "text",
                  "axisLabel": "",
                  "axisPlacement": "auto",
                  "barAlignment": 0,
                  "drawStyle": "line",
                  "fillOpacity": 25,
                  "gradientMode": "opacity",
                  "hideFrom": {
                    "legend": false,
                    "tooltip": false,
                    "viz": false
                  },
                  "lineInterpolation": "smooth",
                  "lineWidth": 2,
                  "pointSize": 5,
                  "scaleDistribution": {
                    "type": "linear"
                  },
                  "showPoints": "never",
                  "spanNulls": false,
                  "stacking": {
                    "group": "A",
                    "mode": "none"
                  },
                  "thresholdsStyle": {
                    "mode": "off"
                  }
                },
                "decimals": 2,
                "mappings": [],
                "thresholds": {
                  "mode": "absolute",
                  "steps": [
                    {
                      "color": "green",
                      "value": null
                    },
                    {
                      "color": "red",
                      "value": 80
                    }
                  ]
                },
                "unit": "bytes"
              },
              "overrides": []
            },
            "gridPos": {
              "h": 8,
              "w": 12,
              "x": 12,
              "y": 106
            },
            "id": 57,
            "options": {
              "legend": {
                "calcs": [],
                "displayMode": "list",
                "placement": "right",
                "showLegend": false
              },
              "tooltip": {
                "mode": "multi",
                "sort": "desc"
              }
            },
            "pluginVersion": "8.3.3",
            "targets": [
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "$${datasource}"
                },
                "editorMode": "code",
                "exemplar": true,
                "expr": "rate(node_disk_written_bytes_total{instance=\"$instance\"}[$__rate_interval])",
                "hide": false,
                "interval": "$resolution",
                "legendFormat": "{{device}}",
                "range": true,
                "refId": "A"
              }
            ],
            "title": "Writes by disk (bytes)",
            "type": "timeseries"
          },
          {
            "datasource": {
              "type": "prometheus",
              "uid": "$${datasource}"
            },
            "fieldConfig": {
              "defaults": {
                "color": {
                  "mode": "palette-classic"
                },
                "custom": {
                  "axisCenteredZero": false,
                  "axisColorMode": "text",
                  "axisLabel": "",
                  "axisPlacement": "auto",
                  "barAlignment": 0,
                  "drawStyle": "line",
                  "fillOpacity": 25,
                  "gradientMode": "opacity",
                  "hideFrom": {
                    "legend": false,
                    "tooltip": false,
                    "viz": false
                  },
                  "lineInterpolation": "smooth",
                  "lineWidth": 2,
                  "pointSize": 5,
                  "scaleDistribution": {
                    "type": "linear"
                  },
                  "showPoints": "never",
                  "spanNulls": false,
                  "stacking": {
                    "group": "A",
                    "mode": "none"
                  },
                  "thresholdsStyle": {
                    "mode": "off"
                  }
                },
                "decimals": 2,
                "mappings": [],
                "thresholds": {
                  "mode": "absolute",
                  "steps": [
                    {
                      "color": "green",
                      "value": null
                    },
                    {
                      "color": "red",
                      "value": 80
                    }
                  ]
                },
                "unit": "read/s"
              },
              "overrides": []
            },
            "gridPos": {
              "h": 8,
              "w": 12,
              "x": 0,
              "y": 114
            },
            "id": 51,
            "options": {
              "legend": {
                "calcs": [],
                "displayMode": "list",
                "placement": "right",
                "showLegend": false
              },
              "tooltip": {
                "mode": "multi",
                "sort": "desc"
              }
            },
            "pluginVersion": "8.3.3",
            "targets": [
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "$${datasource}"
                },
                "editorMode": "code",
                "exemplar": true,
                "expr": "rate(node_disk_reads_completed_total{instance=\"$instance\"}[$__rate_interval])",
                "interval": "$resolution",
                "legendFormat": "{{device}}",
                "range": true,
                "refId": "A"
              }
            ],
            "title": "Completed reads by disk",
            "type": "timeseries"
          },
          {
            "datasource": {
              "type": "prometheus",
              "uid": "$${datasource}"
            },
            "fieldConfig": {
              "defaults": {
                "color": {
                  "mode": "palette-classic"
                },
                "custom": {
                  "axisCenteredZero": false,
                  "axisColorMode": "text",
                  "axisLabel": "",
                  "axisPlacement": "auto",
                  "barAlignment": 0,
                  "drawStyle": "line",
                  "fillOpacity": 25,
                  "gradientMode": "opacity",
                  "hideFrom": {
                    "legend": false,
                    "tooltip": false,
                    "viz": false
                  },
                  "lineInterpolation": "smooth",
                  "lineWidth": 2,
                  "pointSize": 5,
                  "scaleDistribution": {
                    "type": "linear"
                  },
                  "showPoints": "never",
                  "spanNulls": false,
                  "stacking": {
                    "group": "A",
                    "mode": "none"
                  },
                  "thresholdsStyle": {
                    "mode": "off"
                  }
                },
                "decimals": 2,
                "mappings": [],
                "thresholds": {
                  "mode": "absolute",
                  "steps": [
                    {
                      "color": "green",
                      "value": null
                    },
                    {
                      "color": "red",
                      "value": 80
                    }
                  ]
                },
                "unit": "write/s"
              },
              "overrides": []
            },
            "gridPos": {
              "h": 8,
              "w": 12,
              "x": 12,
              "y": 114
            },
            "id": 56,
            "options": {
              "legend": {
                "calcs": [],
                "displayMode": "list",
                "placement": "right",
                "showLegend": false
              },
              "tooltip": {
                "mode": "multi",
                "sort": "desc"
              }
            },
            "pluginVersion": "8.3.3",
            "targets": [
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "$${datasource}"
                },
                "editorMode": "code",
                "exemplar": true,
                "expr": "rate(node_disk_writes_completed_total{instance=\"$instance\"}[$__rate_interval])",
                "hide": false,
                "interval": "$resolution",
                "legendFormat": "{{device}}",
                "range": true,
                "refId": "A"
              }
            ],
            "title": "Completed writes by disk",
            "type": "timeseries"
          },
          {
            "datasource": {
              "type": "prometheus",
              "uid": "$${datasource}"
            },
            "fieldConfig": {
              "defaults": {
                "color": {
                  "mode": "palette-classic"
                },
                "custom": {
                  "axisCenteredZero": false,
                  "axisColorMode": "text",
                  "axisLabel": "",
                  "axisPlacement": "auto",
                  "barAlignment": 0,
                  "drawStyle": "line",
                  "fillOpacity": 25,
                  "gradientMode": "opacity",
                  "hideFrom": {
                    "legend": false,
                    "tooltip": false,
                    "viz": false
                  },
                  "lineInterpolation": "smooth",
                  "lineWidth": 2,
                  "pointSize": 5,
                  "scaleDistribution": {
                    "type": "linear"
                  },
                  "showPoints": "never",
                  "spanNulls": false,
                  "stacking": {
                    "group": "A",
                    "mode": "none"
                  },
                  "thresholdsStyle": {
                    "mode": "off"
                  }
                },
                "decimals": 2,
                "mappings": [],
                "thresholds": {
                  "mode": "absolute",
                  "steps": [
                    {
                      "color": "green",
                      "value": null
                    },
                    {
                      "color": "red",
                      "value": 80
                    }
                  ]
                },
                "unit": "io/s"
              },
              "overrides": []
            },
            "gridPos": {
              "h": 8,
              "w": 12,
              "x": 0,
              "y": 122
            },
            "id": 58,
            "options": {
              "legend": {
                "calcs": [],
                "displayMode": "list",
                "placement": "right",
                "showLegend": false
              },
              "tooltip": {
                "mode": "multi",
                "sort": "desc"
              }
            },
            "pluginVersion": "8.3.3",
            "targets": [
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "$${datasource}"
                },
                "editorMode": "code",
                "exemplar": true,
                "expr": "rate(node_disk_io_now{instance=\"$instance\"}[$__rate_interval]) ",
                "interval": "$resolution",
                "legendFormat": "{{device}}",
                "range": true,
                "refId": "A"
              }
            ],
            "title": "Disk(s) io/s",
            "type": "timeseries"
          },
          {
            "datasource": {
              "type": "prometheus",
              "uid": "$${datasource}"
            },
            "fieldConfig": {
              "defaults": {
                "color": {
                  "mode": "palette-classic"
                },
                "custom": {
                  "axisCenteredZero": false,
                  "axisColorMode": "text",
                  "axisLabel": "",
                  "axisPlacement": "auto",
                  "barAlignment": 0,
                  "drawStyle": "line",
                  "fillOpacity": 25,
                  "gradientMode": "opacity",
                  "hideFrom": {
                    "legend": false,
                    "tooltip": false,
                    "viz": false
                  },
                  "lineInterpolation": "smooth",
                  "lineWidth": 2,
                  "pointSize": 5,
                  "scaleDistribution": {
                    "type": "linear"
                  },
                  "showPoints": "never",
                  "spanNulls": false,
                  "stacking": {
                    "group": "A",
                    "mode": "none"
                  },
                  "thresholdsStyle": {
                    "mode": "off"
                  }
                },
                "decimals": 2,
                "mappings": [],
                "thresholds": {
                  "mode": "absolute",
                  "steps": [
                    {
                      "color": "green",
                      "value": null
                    },
                    {
                      "color": "red",
                      "value": 80
                    }
                  ]
                },
                "unit": "none"
              },
              "overrides": []
            },
            "gridPos": {
              "h": 8,
              "w": 12,
              "x": 12,
              "y": 122
            },
            "id": 55,
            "options": {
              "legend": {
                "calcs": [],
                "displayMode": "list",
                "placement": "right",
                "showLegend": false
              },
              "tooltip": {
                "mode": "multi",
                "sort": "desc"
              }
            },
            "pluginVersion": "8.3.3",
            "targets": [
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "$${datasource}"
                },
                "editorMode": "code",
                "exemplar": true,
                "expr": "sum(node_filesystem_device_error) by (mountpoint)",
                "interval": "$resolution",
                "legendFormat": "{{ mountpoint }}",
                "range": true,
                "refId": "A"
              }
            ],
            "title": "FS - Device Errors",
            "type": "timeseries"
          }
        ],
        "refresh": "30s",
        "schemaVersion": 37,
        "style": "dark",
        "tags": [
          "Kubernetes",
          "Prometheus"
        ],
        "templating": {
          "list": [
            {
              "current": {
                "selected": false,
                "text": "",
                "value": ""
              },
              "datasource": {
                "type": "prometheus",
                "uid": "$${datasource}"
              },
              "definition": "label_values(node_uname_info, job)",
              "hide": 2,
              "includeAll": false,
              "multi": false,
              "name": "job",
              "options": [],
              "query": {
                "query": "label_values(node_uname_info, job)",
                "refId": "StandardVariableQuery"
              },
              "refresh": 1,
              "regex": "",
              "skipUrlSync": false,
              "sort": 1,
              "type": "query"
            },
            {
              "current": {
                "selected": false,
                "text": "",
                "value": ""
              },
              "hide": 0,
              "includeAll": false,
              "multi": false,
              "name": "datasource",
              "options": [],
              "query": "prometheus",
              "queryValue": "",
              "refresh": 1,
              "regex": "",
              "skipUrlSync": false,
              "type": "datasource"
            },
            {
              "current": {
                "selected": true,
                "text": "30s",
                "value": "30s"
              },
              "hide": 0,
              "includeAll": false,
              "multi": false,
              "name": "resolution",
              "options": [
                {
                  "selected": false,
                  "text": "1s",
                  "value": "1s"
                },
                {
                  "selected": false,
                  "text": "15s",
                  "value": "15s"
                },
                {
                  "selected": true,
                  "text": "30s",
                  "value": "30s"
                },
                {
                  "selected": false,
                  "text": "1m",
                  "value": "1m"
                },
                {
                  "selected": false,
                  "text": "3m",
                  "value": "3m"
                },
                {
                  "selected": false,
                  "text": "5m",
                  "value": "5m"
                }
              ],
              "query": "1s, 15s, 30s, 1m, 3m, 5m",
              "queryValue": "",
              "skipUrlSync": false,
              "type": "custom"
            },
            {
              "current": {
                "selected": false,
                "text": "",
                "value": ""
              },
              "datasource": {
                "type": "prometheus",
                "uid": "$${datasource}"
              },
              "definition": "label_values(kube_node_info, node)",
              "hide": 0,
              "includeAll": false,
              "multi": false,
              "name": "node",
              "options": [],
              "query": {
                "query": "label_values(kube_node_info, node)",
                "refId": "StandardVariableQuery"
              },
              "refresh": 2,
              "regex": "",
              "skipUrlSync": false,
              "sort": 1,
              "type": "query"
            },
            {
              "current": {
                "selected": false,
                "text": "",
                "value": ""
              },
              "datasource": {
                "type": "prometheus",
                "uid": "$${datasource}"
              },
              "definition": "label_values(node_uname_info{nodename=~\"(?i:($node))\"}, instance)",
              "hide": 2,
              "includeAll": false,
              "multi": false,
              "name": "instance",
              "options": [],
              "query": {
                "query": "label_values(node_uname_info{nodename=~\"(?i:($node))\"}, instance)",
                "refId": "StandardVariableQuery"
              },
              "refresh": 2,
              "regex": "",
              "skipUrlSync": false,
              "sort": 1,
              "type": "query"
            }
          ]
        },
        "time": {
          "from": "now-1h",
          "to": "now"
        },
        "timepicker": {},
        "timezone": "",
        "title": "Kubernetes / Views / Nodes",
        "uid": "k8s_views_nodes",
        "version": 19,
        "weekStart": ""
      }
      
      EOT
    }
    "kind" = "ConfigMap"
    "metadata" = {
      "annotations" = {
        "grafana_folder" = "Kubernetes"
      }
      "labels" = {
        "grafana_dashboard" = "1"
      }
      "name"      = "dashboards-k8s-views-nodes"
      "namespace" = "prometheus"
    }
  }
}

resource "kubernetes_manifest" "configmap_prometheus_dashboards_k8s_views_pods" {
  manifest = {
    "apiVersion" = "v1"
    "data" = {
      "k8s-views-pods.json" = <<-EOT
      {
        "__inputs": [
          {
            "name": "DS_PROMETHEUS",
            "label": "Prometheus",
            "description": "",
            "type": "datasource",
            "pluginId": "prometheus",
            "pluginName": "Prometheus"
          }
        ],
        "__elements": [],
        "__requires": [
          {
            "type": "grafana",
            "id": "grafana",
            "name": "Grafana",
            "version": "8.3.4"
          },
          {
            "type": "datasource",
            "id": "prometheus",
            "name": "Prometheus",
            "version": "5.0.0"
          },
          {
            "type": "panel",
            "id": "timeseries",
            "name": "Time series",
            "version": ""
          },
          {
            "type": "panel",
            "id": "stat",
            "name": "Stat",
            "version": ""
          },
          {
            "type": "panel",
            "id": "gauge",
            "name": "Gauge",
            "version": ""
          },
          {
            "type": "panel",
            "id": "table",
            "name": "Table",
            "version": ""
          }
        ],
        "annotations": {
          "list": [
            {
              "builtIn": 1,
              "datasource": {
                "type": "datasource",
                "uid": "grafana"
              },
              "enable": true,
              "hide": true,
              "iconColor": "rgba(0, 211, 255, 1)",
              "name": "Annotations & Alerts",
              "target": {
                "limit": 100,
                "matchAny": false,
                "tags": [],
                "type": "dashboard"
              },
              "type": "dashboard"
            }
          ]
        },
        "description": "This is a modern 'Pods View' dashboard for your Kubernetes cluster(s). Made for kube-prometheus-stack and take advantage of the latest Grafana features. GitHub repository: https://github.com/dotdc/grafana-dashboards-kubernetes",
        "editable": true,
        "fiscalYearStartMonth": 0,
        "graphTooltip": 1,
        "links": [],
        "liveNow": false,
        "panels": [
          {
            "collapsed": false,
            "datasource": {
              "type": "datasource",
              "uid": "grafana"
            },
            "gridPos": {
              "h": 1,
              "w": 24,
              "x": 0,
              "y": 0
            },
            "id": 43,
            "panels": [],
            "targets": [
              {
                "datasource": {
                  "type": "datasource",
                  "uid": "grafana"
                },
                "refId": "A"
              }
            ],
            "title": "Information",
            "type": "row"
          },
          {
            "datasource": {
              "type": "prometheus",
              "uid": "$${datasource}"
            },
            "fieldConfig": {
              "defaults": {
                "mappings": [],
                "thresholds": {
                  "mode": "absolute",
                  "steps": [
                    {
                      "color": "rgb(255, 255, 255)",
                      "value": null
                    }
                  ]
                },
                "unit": "none"
              },
              "overrides": []
            },
            "gridPos": {
              "h": 2,
              "w": 12,
              "x": 0,
              "y": 1
            },
            "id": 2,
            "options": {
              "colorMode": "none",
              "graphMode": "none",
              "justifyMode": "auto",
              "orientation": "auto",
              "reduceOptions": {
                "calcs": [
                  "mean"
                ],
                "fields": "",
                "values": false
              },
              "textMode": "name"
            },
            "pluginVersion": "10.1.0",
            "targets": [
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "$${datasource}"
                },
                "exemplar": false,
                "expr": "kube_pod_info{namespace=\"$namespace\", pod=\"$pod\"}",
                "instant": true,
                "interval": "",
                "legendFormat": "{{ created_by_kind }}: {{ created_by_name }}",
                "refId": "A"
              }
            ],
            "title": "Created by",
            "type": "stat"
          },
          {
            "datasource": {
              "type": "prometheus",
              "uid": "$${datasource}"
            },
            "fieldConfig": {
              "defaults": {
                "links": [
                  {
                    "title": "",
                    "url": "/d/k8s_views_nodes/kubernetes-views-nodes?var-datasource=$${datasource}&var-node=$${__data.fields.node}"
                  }
                ],
                "mappings": [],
                "thresholds": {
                  "mode": "absolute",
                  "steps": [
                    {
                      "color": "rgb(255, 255, 255)",
                      "value": null
                    }
                  ]
                },
                "unit": "none"
              },
              "overrides": []
            },
            "gridPos": {
              "h": 2,
              "w": 6,
              "x": 12,
              "y": 1
            },
            "id": 33,
            "options": {
              "colorMode": "none",
              "graphMode": "none",
              "justifyMode": "auto",
              "orientation": "auto",
              "reduceOptions": {
                "calcs": [
                  "mean"
                ],
                "fields": "",
                "values": false
              },
              "textMode": "name"
            },
            "pluginVersion": "10.1.0",
            "targets": [
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "$${datasource}"
                },
                "exemplar": false,
                "expr": "kube_pod_info{namespace=\"$namespace\", pod=\"$pod\"}",
                "instant": true,
                "interval": "",
                "legendFormat": "{{ node }}",
                "refId": "A"
              }
            ],
            "title": "Running on",
            "type": "stat"
          },
          {
            "datasource": {
              "type": "prometheus",
              "uid": "$${datasource}"
            },
            "fieldConfig": {
              "defaults": {
                "mappings": [],
                "thresholds": {
                  "mode": "absolute",
                  "steps": [
                    {
                      "color": "rgb(255, 255, 255)",
                      "value": null
                    }
                  ]
                },
                "unit": "none"
              },
              "overrides": []
            },
            "gridPos": {
              "h": 2,
              "w": 6,
              "x": 18,
              "y": 1
            },
            "id": 41,
            "options": {
              "colorMode": "none",
              "graphMode": "none",
              "justifyMode": "auto",
              "orientation": "auto",
              "reduceOptions": {
                "calcs": [
                  "mean"
                ],
                "fields": "",
                "values": false
              },
              "textMode": "name"
            },
            "pluginVersion": "10.1.0",
            "targets": [
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "$${datasource}"
                },
                "exemplar": false,
                "expr": "kube_pod_info{namespace=\"$namespace\", pod=\"$pod\"}",
                "instant": true,
                "interval": "",
                "legendFormat": "{{ pod_ip }}",
                "refId": "A"
              }
            ],
            "title": "Pod IP",
            "type": "stat"
          },
          {
            "datasource": {
              "type": "prometheus",
              "uid": "$${datasource}"
            },
            "fieldConfig": {
              "defaults": {
                "mappings": [],
                "thresholds": {
                  "mode": "absolute",
                  "steps": [
                    {
                      "color": "rgb(255, 255, 255)",
                      "value": null
                    }
                  ]
                },
                "unit": "none"
              },
              "overrides": []
            },
            "gridPos": {
              "h": 2,
              "w": 5,
              "x": 0,
              "y": 3
            },
            "id": 52,
            "options": {
              "colorMode": "none",
              "graphMode": "none",
              "justifyMode": "auto",
              "orientation": "auto",
              "reduceOptions": {
                "calcs": [
                  "mean"
                ],
                "fields": "",
                "values": false
              },
              "textMode": "name"
            },
            "pluginVersion": "10.1.0",
            "targets": [
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "$${datasource}"
                },
                "editorMode": "code",
                "exemplar": false,
                "expr": "kube_pod_info{namespace=\"$namespace\", pod=\"$pod\", priority_class!=\"\"}",
                "format": "time_series",
                "instant": true,
                "interval": "",
                "legendFormat": "{{ priority_class }}",
                "range": false,
                "refId": "A"
              }
            ],
            "title": "Priority Class",
            "type": "stat"
          },
          {
            "datasource": {
              "type": "prometheus",
              "uid": "$${datasource}"
            },
            "fieldConfig": {
              "defaults": {
                "color": {
                  "mode": "thresholds"
                },
                "mappings": [],
                "thresholds": {
                  "mode": "absolute",
                  "steps": [
                    {
                      "color": "green",
                      "value": null
                    }
                  ]
                },
                "unit": "none"
              },
              "overrides": [
                {
                  "matcher": {
                    "id": "byName",
                    "options": "Burstable"
                  },
                  "properties": [
                    {
                      "id": "color",
                      "value": {
                        "fixedColor": "red",
                        "mode": "fixed"
                      }
                    }
                  ]
                },
                {
                  "matcher": {
                    "id": "byName",
                    "options": "BestEffort"
                  },
                  "properties": [
                    {
                      "id": "color",
                      "value": {
                        "fixedColor": "orange",
                        "mode": "fixed"
                      }
                    }
                  ]
                }
              ]
            },
            "gridPos": {
              "h": 2,
              "w": 7,
              "x": 5,
              "y": 3
            },
            "id": 53,
            "options": {
              "colorMode": "value",
              "graphMode": "none",
              "justifyMode": "auto",
              "orientation": "auto",
              "reduceOptions": {
                "calcs": [],
                "fields": "",
                "values": false
              },
              "textMode": "name"
            },
            "pluginVersion": "10.1.0",
            "targets": [
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "$${datasource}"
                },
                "editorMode": "code",
                "exemplar": false,
                "expr": "kube_pod_status_qos_class{namespace=\"$namespace\", pod=\"$pod\"} > 0",
                "instant": true,
                "interval": "",
                "legendFormat": "{{ qos_class }}",
                "refId": "A"
              }
            ],
            "title": "QOS Class",
            "type": "stat"
          },
          {
            "datasource": {
              "type": "prometheus",
              "uid": "$${datasource}"
            },
            "fieldConfig": {
              "defaults": {
                "mappings": [],
                "thresholds": {
                  "mode": "absolute",
                  "steps": [
                    {
                      "color": "text",
                      "value": null
                    },
                    {
                      "color": "red",
                      "value": 1
                    }
                  ]
                },
                "unit": "none"
              },
              "overrides": []
            },
            "gridPos": {
              "h": 2,
              "w": 6,
              "x": 12,
              "y": 3
            },
            "id": 56,
            "options": {
              "colorMode": "value",
              "graphMode": "none",
              "justifyMode": "auto",
              "orientation": "auto",
              "reduceOptions": {
                "calcs": [],
                "fields": "",
                "values": false
              },
              "textMode": "name"
            },
            "pluginVersion": "10.1.0",
            "targets": [
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "$${datasource}"
                },
                "editorMode": "code",
                "exemplar": false,
                "expr": "kube_pod_container_status_last_terminated_reason{namespace=\"$namespace\", pod=\"$pod\"}",
                "instant": true,
                "interval": "",
                "legendFormat": "{{ reason }}",
                "refId": "A"
              }
            ],
            "title": "Last Terminated Reason",
            "type": "stat"
          },
          {
            "datasource": {
              "type": "prometheus",
              "uid": "$${datasource}"
            },
            "fieldConfig": {
              "defaults": {
                "mappings": [],
                "thresholds": {
                  "mode": "absolute",
                  "steps": [
                    {
                      "color": "text",
                      "value": null
                    },
                    {
                      "color": "red",
                      "value": 1
                    },
                    {
                      "color": "#EAB839",
                      "value": 2
                    }
                  ]
                },
                "unit": "none"
              },
              "overrides": []
            },
            "gridPos": {
              "h": 2,
              "w": 6,
              "x": 18,
              "y": 3
            },
            "id": 57,
            "options": {
              "colorMode": "value",
              "graphMode": "none",
              "justifyMode": "auto",
              "orientation": "auto",
              "reduceOptions": {
                "calcs": [],
                "fields": "",
                "values": true
              },
              "textMode": "value"
            },
            "pluginVersion": "10.1.0",
            "targets": [
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "$${datasource}"
                },
                "editorMode": "code",
                "exemplar": false,
                "expr": "kube_pod_container_status_last_terminated_exitcode{namespace=\"$namespace\", pod=\"$pod\"}",
                "instant": true,
                "interval": "",
                "legendFormat": "__auto",
                "range": false,
                "refId": "A"
              }
            ],
            "title": "Last Terminated Exit Code",
            "type": "stat"
          },
          {
            "collapsed": false,
            "datasource": {
              "type": "datasource",
              "uid": "grafana"
            },
            "gridPos": {
              "h": 1,
              "w": 24,
              "x": 0,
              "y": 5
            },
            "id": 47,
            "panels": [],
            "targets": [
              {
                "datasource": {
                  "type": "datasource",
                  "uid": "grafana"
                },
                "refId": "A"
              }
            ],
            "title": "Resources",
            "type": "row"
          },
          {
            "datasource": {
              "type": "prometheus",
              "uid": "$${datasource}"
            },
            "fieldConfig": {
              "defaults": {
                "color": {
                  "fixedColor": "blue",
                  "mode": "fixed"
                },
                "decimals": 2,
                "mappings": [],
                "max": 1,
                "min": 0,
                "thresholds": {
                  "mode": "percentage",
                  "steps": [
                    {
                      "color": "green",
                      "value": null
                    },
                    {
                      "color": "#EAB839",
                      "value": 60
                    },
                    {
                      "color": "red",
                      "value": 75
                    }
                  ]
                },
                "unit": "percentunit"
              },
              "overrides": []
            },
            "gridPos": {
              "h": 8,
              "w": 3,
              "x": 0,
              "y": 6
            },
            "id": 39,
            "options": {
              "orientation": "auto",
              "reduceOptions": {
                "calcs": [
                  "last"
                ],
                "fields": "",
                "values": false
              },
              "showThresholdLabels": false,
              "showThresholdMarkers": true
            },
            "pluginVersion": "10.1.0",
            "targets": [
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "$${datasource}"
                },
                "editorMode": "code",
                "exemplar": false,
                "expr": "sum(rate(container_cpu_usage_seconds_total{namespace=\"$namespace\", pod=\"$pod\", image!=\"\"}[$__rate_interval])) / sum(kube_pod_container_resource_requests{namespace=\"$namespace\", pod=\"$pod\", resource=\"cpu\"})",
                "instant": true,
                "interval": "$resolution",
                "legendFormat": "Requests",
                "refId": "A"
              }
            ],
            "title": "Total pod CPU Requests usage",
            "type": "gauge"
          },
          {
            "datasource": {
              "type": "prometheus",
              "uid": "$${datasource}"
            },
            "fieldConfig": {
              "defaults": {
                "decimals": 2,
                "mappings": [],
                "max": 1,
                "min": 0,
                "thresholds": {
                  "mode": "percentage",
                  "steps": [
                    {
                      "color": "green",
                      "value": null
                    },
                    {
                      "color": "#EAB839",
                      "value": 60
                    },
                    {
                      "color": "red",
                      "value": 75
                    }
                  ]
                },
                "unit": "percentunit"
              },
              "overrides": []
            },
            "gridPos": {
              "h": 8,
              "w": 3,
              "x": 3,
              "y": 6
            },
            "id": 48,
            "options": {
              "orientation": "auto",
              "reduceOptions": {
                "calcs": [
                  "last"
                ],
                "fields": "",
                "values": false
              },
              "showThresholdLabels": false,
              "showThresholdMarkers": true
            },
            "pluginVersion": "10.1.0",
            "targets": [
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "$${datasource}"
                },
                "editorMode": "code",
                "exemplar": false,
                "expr": "sum(rate(container_cpu_usage_seconds_total{namespace=\"$namespace\", pod=\"$pod\", image!=\"\"}[$__rate_interval])) / sum(kube_pod_container_resource_limits{namespace=\"$namespace\", pod=\"$pod\", resource=\"cpu\"})",
                "instant": true,
                "interval": "$resolution",
                "legendFormat": "Limits",
                "refId": "A"
              }
            ],
            "title": "Total pod CPU Limits usage",
            "type": "gauge"
          },
          {
            "datasource": {
              "type": "prometheus",
              "uid": "$${datasource}"
            },
            "fieldConfig": {
              "defaults": {
                "color": {
                  "fixedColor": "blue",
                  "mode": "fixed"
                },
                "decimals": 2,
                "mappings": [],
                "max": 1,
                "min": 0,
                "thresholds": {
                  "mode": "percentage",
                  "steps": [
                    {
                      "color": "blue",
                      "value": null
                    },
                    {
                      "color": "#EAB839",
                      "value": 80
                    },
                    {
                      "color": "red",
                      "value": 99
                    }
                  ]
                },
                "unit": "percentunit"
              },
              "overrides": []
            },
            "gridPos": {
              "h": 8,
              "w": 3,
              "x": 6,
              "y": 6
            },
            "id": 40,
            "options": {
              "orientation": "auto",
              "reduceOptions": {
                "calcs": [
                  "last"
                ],
                "fields": "",
                "values": false
              },
              "showThresholdLabels": false,
              "showThresholdMarkers": true
            },
            "pluginVersion": "10.1.0",
            "targets": [
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "$${datasource}"
                },
                "exemplar": false,
                "expr": "sum(container_memory_working_set_bytes{namespace=\"$namespace\", pod=\"$pod\", image!=\"\"}) / sum(kube_pod_container_resource_requests{namespace=\"$namespace\", pod=\"$pod\", resource=\"memory\"})",
                "instant": true,
                "interval": "$resolution",
                "legendFormat": "Requests",
                "refId": "A"
              }
            ],
            "title": "Total pod RAM Requests usage",
            "type": "gauge"
          },
          {
            "datasource": {
              "type": "prometheus",
              "uid": "$${datasource}"
            },
            "fieldConfig": {
              "defaults": {
                "decimals": 2,
                "mappings": [],
                "max": 1,
                "min": 0,
                "thresholds": {
                  "mode": "percentage",
                  "steps": [
                    {
                      "color": "green",
                      "value": null
                    },
                    {
                      "color": "#EAB839",
                      "value": 60
                    },
                    {
                      "color": "red",
                      "value": 75
                    }
                  ]
                },
                "unit": "percentunit"
              },
              "overrides": []
            },
            "gridPos": {
              "h": 8,
              "w": 3,
              "x": 9,
              "y": 6
            },
            "id": 49,
            "options": {
              "orientation": "auto",
              "reduceOptions": {
                "calcs": [
                  "last"
                ],
                "fields": "",
                "values": false
              },
              "showThresholdLabels": false,
              "showThresholdMarkers": true
            },
            "pluginVersion": "10.1.0",
            "targets": [
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "$${datasource}"
                },
                "exemplar": false,
                "expr": "sum(container_memory_working_set_bytes{namespace=\"$namespace\", pod=\"$pod\", image!=\"\"}) / sum(kube_pod_container_resource_limits{namespace=\"$namespace\", pod=\"$pod\", resource=\"memory\"}) ",
                "instant": true,
                "interval": "$resolution",
                "legendFormat": "Limits",
                "refId": "B"
              }
            ],
            "title": "Total pod RAM Limits usage",
            "type": "gauge"
          },
          {
            "datasource": {
              "type": "prometheus",
              "uid": "$${datasource}"
            },
            "fieldConfig": {
              "defaults": {
                "custom": {
                  "align": "auto",
                  "cellOptions": {
                    "type": "auto"
                  },
                  "filterable": false,
                  "inspect": false,
                  "minWidth": 100
                },
                "decimals": 4,
                "mappings": [],
                "thresholds": {
                  "mode": "absolute",
                  "steps": [
                    {
                      "color": "blue",
                      "value": null
                    }
                  ]
                },
                "unit": "none"
              },
              "overrides": [
                {
                  "matcher": {
                    "id": "byName",
                    "options": "Memory Requests"
                  },
                  "properties": [
                    {
                      "id": "unit",
                      "value": "bytes"
                    },
                    {
                      "id": "decimals",
                      "value": 2
                    }
                  ]
                },
                {
                  "matcher": {
                    "id": "byName",
                    "options": "Memory Limits"
                  },
                  "properties": [
                    {
                      "id": "unit",
                      "value": "bytes"
                    },
                    {
                      "id": "decimals",
                      "value": 2
                    }
                  ]
                },
                {
                  "matcher": {
                    "id": "byName",
                    "options": "Memory Used"
                  },
                  "properties": [
                    {
                      "id": "unit",
                      "value": "bytes"
                    },
                    {
                      "id": "decimals",
                      "value": 2
                    }
                  ]
                }
              ]
            },
            "gridPos": {
              "h": 8,
              "w": 12,
              "x": 12,
              "y": 6
            },
            "id": 38,
            "options": {
              "cellHeight": "sm",
              "footer": {
                "countRows": false,
                "fields": "",
                "reducer": [
                  "sum"
                ],
                "show": false
              },
              "showHeader": true,
              "sortBy": []
            },
            "pluginVersion": "10.1.0",
            "targets": [
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "$${datasource}"
                },
                "editorMode": "code",
                "exemplar": false,
                "expr": "sum(kube_pod_container_resource_requests{namespace=\"$namespace\", pod=\"$pod\", resource=\"cpu\"}) by (container)",
                "format": "table",
                "instant": true,
                "interval": "",
                "intervalFactor": 1,
                "legendFormat": "",
                "refId": "A"
              },
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "$${datasource}"
                },
                "editorMode": "code",
                "exemplar": false,
                "expr": "sum(kube_pod_container_resource_limits{namespace=\"$namespace\", pod=\"$pod\", resource=\"cpu\"}) by (container)",
                "format": "table",
                "instant": true,
                "interval": "",
                "intervalFactor": 1,
                "legendFormat": "",
                "refId": "B"
              },
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "$${datasource}"
                },
                "editorMode": "code",
                "exemplar": false,
                "expr": "sum(kube_pod_container_resource_requests{namespace=\"$namespace\", pod=\"$pod\", resource=\"memory\"}) by (container)",
                "format": "table",
                "instant": true,
                "interval": "",
                "legendFormat": "",
                "refId": "C"
              },
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "$${datasource}"
                },
                "editorMode": "code",
                "exemplar": false,
                "expr": "sum(kube_pod_container_resource_limits{namespace=\"$namespace\", pod=\"$pod\", resource=\"memory\"}) by (container)",
                "format": "table",
                "instant": true,
                "interval": "",
                "legendFormat": "",
                "refId": "D"
              },
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "$${datasource}"
                },
                "editorMode": "code",
                "exemplar": false,
                "expr": "sum(rate(container_cpu_usage_seconds_total{namespace=\"$namespace\", pod=\"$pod\", image!=\"\", container!=\"\"}[$__rate_interval])) by (container)",
                "format": "table",
                "hide": false,
                "instant": true,
                "legendFormat": "__auto",
                "range": false,
                "refId": "E"
              },
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "$${datasource}"
                },
                "editorMode": "code",
                "exemplar": false,
                "expr": "sum(container_memory_working_set_bytes{namespace=\"$namespace\", pod=\"$pod\", image!=\"\", container!=\"\"}) by (container)",
                "format": "table",
                "hide": false,
                "instant": true,
                "range": false,
                "refId": "F"
              }
            ],
            "title": "Resources by container",
            "transformations": [
              {
                "id": "seriesToColumns",
                "options": {
                  "byField": "container"
                }
              },
              {
                "id": "organize",
                "options": {
                  "excludeByName": {
                    "Time": true,
                    "Time 1": true,
                    "Time 2": true,
                    "Time 4": true,
                    "__name__": true,
                    "__name__ 1": true,
                    "__name__ 2": true,
                    "__name__ 3": true,
                    "__name__ 4": true,
                    "container": false,
                    "endpoint": true,
                    "endpoint 2": true,
                    "endpoint 3": true,
                    "endpoint 4": true,
                    "instance": true,
                    "instance 2": true,
                    "instance 3": true,
                    "instance 4": true,
                    "job": true,
                    "job 2": true,
                    "job 3": true,
                    "job 4": true,
                    "namespace": true,
                    "namespace 2": true,
                    "namespace 3": true,
                    "namespace 4": true,
                    "node": true,
                    "node 2": true,
                    "node 3": true,
                    "node 4": true,
                    "pod": true,
                    "pod 2": true,
                    "pod 3": true,
                    "pod 4": true,
                    "resource 1": true,
                    "resource 2": true,
                    "resource 3": true,
                    "resource 4": true,
                    "service": true,
                    "service 2": true,
                    "service 3": true,
                    "service 4": true,
                    "uid 1": true,
                    "uid 2": true,
                    "uid 3": true,
                    "uid 4": true,
                    "unit 1": true,
                    "unit 2": true,
                    "unit 3": true,
                    "unit 4": true
                  },
                  "indexByName": {
                    "Time 1": 7,
                    "Time 2": 8,
                    "Time 3": 9,
                    "Time 4": 10,
                    "Time 5": 11,
                    "Time 6": 12,
                    "Value #A": 2,
                    "Value #B": 3,
                    "Value #C": 5,
                    "Value #D": 6,
                    "Value #E": 1,
                    "Value #F": 4,
                    "container": 0
                  },
                  "renameByName": {
                    "Value #A": "CPU Requests",
                    "Value #B": "CPU Limits",
                    "Value #C": "Memory Requests",
                    "Value #D": "Memory Limits",
                    "Value #E": "CPU Used",
                    "Value #F": "Memory Used",
                    "container": "Container"
                  }
                }
              }
            ],
            "type": "table"
          },
          {
            "datasource": {
              "type": "prometheus",
              "uid": "$${datasource}"
            },
            "fieldConfig": {
              "defaults": {
                "color": {
                  "mode": "thresholds"
                },
                "custom": {
                  "axisCenteredZero": false,
                  "axisColorMode": "text",
                  "axisLabel": "Percent",
                  "axisPlacement": "auto",
                  "barAlignment": 0,
                  "drawStyle": "line",
                  "fillOpacity": 25,
                  "gradientMode": "opacity",
                  "hideFrom": {
                    "legend": false,
                    "tooltip": false,
                    "viz": false
                  },
                  "insertNulls": false,
                  "lineInterpolation": "smooth",
                  "lineWidth": 2,
                  "pointSize": 5,
                  "scaleDistribution": {
                    "type": "linear"
                  },
                  "showPoints": "never",
                  "spanNulls": false,
                  "stacking": {
                    "group": "A",
                    "mode": "none"
                  },
                  "thresholdsStyle": {
                    "mode": "area"
                  }
                },
                "mappings": [],
                "max": 1,
                "min": 0,
                "thresholds": {
                  "mode": "percentage",
                  "steps": [
                    {
                      "color": "red",
                      "value": null
                    },
                    {
                      "color": "yellow",
                      "value": 20
                    },
                    {
                      "color": "green",
                      "value": 30
                    },
                    {
                      "color": "yellow",
                      "value": 70
                    },
                    {
                      "color": "red",
                      "value": 80
                    }
                  ]
                },
                "unit": "percentunit"
              },
              "overrides": []
            },
            "gridPos": {
              "h": 8,
              "w": 12,
              "x": 0,
              "y": 14
            },
            "id": 50,
            "options": {
              "legend": {
                "calcs": [],
                "displayMode": "table",
                "placement": "right",
                "showLegend": true
              },
              "tooltip": {
                "mode": "multi",
                "sort": "desc"
              }
            },
            "pluginVersion": "8.3.3",
            "targets": [
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "$${datasource}"
                },
                "editorMode": "code",
                "exemplar": true,
                "expr": "sum(rate(container_cpu_usage_seconds_total{namespace=\"$namespace\", pod=\"$pod\", image!=\"\"}[$__rate_interval])) by (container) / sum(kube_pod_container_resource_requests{namespace=\"$namespace\", pod=\"$pod\", resource=\"cpu\"}) by (container)",
                "interval": "$resolution",
                "legendFormat": "{{ container }}  REQUESTS",
                "range": true,
                "refId": "A"
              },
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "$${datasource}"
                },
                "editorMode": "code",
                "expr": "sum(rate(container_cpu_usage_seconds_total{namespace=\"$namespace\", pod=\"$pod\", image!=\"\"}[$__rate_interval])) by (container) / sum(kube_pod_container_resource_limits{namespace=\"$namespace\", pod=\"$pod\", resource=\"cpu\"}) by (container)",
                "hide": false,
                "legendFormat": "{{ container }}  LIMITS",
                "range": true,
                "refId": "B"
              }
            ],
            "title": "CPU Usage / Requests & Limits by container",
            "type": "timeseries"
          },
          {
            "datasource": {
              "type": "prometheus",
              "uid": "$${datasource}"
            },
            "fieldConfig": {
              "defaults": {
                "color": {
                  "fixedColor": "blue",
                  "mode": "thresholds"
                },
                "custom": {
                  "axisCenteredZero": false,
                  "axisColorMode": "text",
                  "axisLabel": "Percent",
                  "axisPlacement": "auto",
                  "barAlignment": 0,
                  "drawStyle": "line",
                  "fillOpacity": 25,
                  "gradientMode": "opacity",
                  "hideFrom": {
                    "legend": false,
                    "tooltip": false,
                    "viz": false
                  },
                  "insertNulls": false,
                  "lineInterpolation": "smooth",
                  "lineStyle": {
                    "fill": "solid"
                  },
                  "lineWidth": 2,
                  "pointSize": 5,
                  "scaleDistribution": {
                    "type": "linear"
                  },
                  "showPoints": "never",
                  "spanNulls": false,
                  "stacking": {
                    "group": "A",
                    "mode": "none"
                  },
                  "thresholdsStyle": {
                    "mode": "area"
                  }
                },
                "mappings": [],
                "max": 1,
                "min": 0,
                "thresholds": {
                  "mode": "percentage",
                  "steps": [
                    {
                      "color": "red",
                      "value": null
                    },
                    {
                      "color": "yellow",
                      "value": 20
                    },
                    {
                      "color": "green",
                      "value": 30
                    },
                    {
                      "color": "#EAB839",
                      "value": 70
                    },
                    {
                      "color": "red",
                      "value": 80
                    }
                  ]
                },
                "unit": "percentunit"
              },
              "overrides": []
            },
            "gridPos": {
              "h": 8,
              "w": 12,
              "x": 12,
              "y": 14
            },
            "id": 30,
            "options": {
              "legend": {
                "calcs": [],
                "displayMode": "table",
                "placement": "right",
                "showLegend": true
              },
              "tooltip": {
                "mode": "multi",
                "sort": "desc"
              }
            },
            "pluginVersion": "8.3.3",
            "targets": [
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "$${datasource}"
                },
                "editorMode": "code",
                "exemplar": true,
                "expr": "sum(container_memory_working_set_bytes{namespace=\"$namespace\", pod=\"$pod\", image!=\"\"}) by (container) / sum(kube_pod_container_resource_requests{namespace=\"$namespace\", pod=\"$pod\", resource=\"memory\"}) by (container)",
                "interval": "",
                "legendFormat": "{{ container }} REQUESTS",
                "range": true,
                "refId": "A"
              },
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "$${datasource}"
                },
                "editorMode": "code",
                "expr": "sum(container_memory_working_set_bytes{namespace=\"$namespace\", pod=\"$pod\", image!=\"\"}) by (container) / sum(kube_pod_container_resource_limits{namespace=\"$namespace\", pod=\"$pod\", resource=\"memory\"}) by (container)",
                "hide": false,
                "legendFormat": "{{ container }} LIMITS",
                "range": true,
                "refId": "B"
              }
            ],
            "title": "Memory Usage / Requests & Limits by container",
            "type": "timeseries"
          },
          {
            "datasource": {
              "type": "prometheus",
              "uid": "$${datasource}"
            },
            "fieldConfig": {
              "defaults": {
                "color": {
                  "mode": "palette-classic"
                },
                "custom": {
                  "axisCenteredZero": false,
                  "axisColorMode": "text",
                  "axisLabel": "CPU Cores",
                  "axisPlacement": "auto",
                  "barAlignment": 0,
                  "drawStyle": "line",
                  "fillOpacity": 25,
                  "gradientMode": "opacity",
                  "hideFrom": {
                    "legend": false,
                    "tooltip": false,
                    "viz": false
                  },
                  "insertNulls": false,
                  "lineInterpolation": "smooth",
                  "lineWidth": 2,
                  "pointSize": 5,
                  "scaleDistribution": {
                    "type": "linear"
                  },
                  "showPoints": "never",
                  "spanNulls": false,
                  "stacking": {
                    "group": "A",
                    "mode": "none"
                  },
                  "thresholdsStyle": {
                    "mode": "off"
                  }
                },
                "decimals": 4,
                "mappings": [],
                "thresholds": {
                  "mode": "absolute",
                  "steps": [
                    {
                      "color": "green",
                      "value": null
                    },
                    {
                      "color": "red",
                      "value": 80
                    }
                  ]
                },
                "unit": "none"
              },
              "overrides": [
                {
                  "matcher": {
                    "id": "byName",
                    "options": "limit"
                  },
                  "properties": [
                    {
                      "id": "color",
                      "value": {
                        "fixedColor": "#F2495C",
                        "mode": "fixed"
                      }
                    },
                    {
                      "id": "custom.fillOpacity",
                      "value": 0
                    }
                  ]
                }
              ]
            },
            "gridPos": {
              "h": 8,
              "w": 12,
              "x": 0,
              "y": 22
            },
            "id": 29,
            "options": {
              "legend": {
                "calcs": [
                  "min",
                  "max",
                  "mean"
                ],
                "displayMode": "table",
                "placement": "right",
                "showLegend": true
              },
              "tooltip": {
                "mode": "multi",
                "sort": "desc"
              }
            },
            "pluginVersion": "8.3.3",
            "targets": [
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "$${datasource}"
                },
                "editorMode": "code",
                "exemplar": true,
                "expr": "sum(rate(container_cpu_usage_seconds_total{namespace=\"$namespace\", pod=\"$pod\", image!=\"\", container!=\"\"}[$__rate_interval])) by (container)",
                "interval": "$resolution",
                "legendFormat": "{{ container }}",
                "range": true,
                "refId": "A"
              }
            ],
            "title": "CPU Usage by container",
            "type": "timeseries"
          },
          {
            "datasource": {
              "type": "prometheus",
              "uid": "$${datasource}"
            },
            "fieldConfig": {
              "defaults": {
                "color": {
                  "mode": "palette-classic"
                },
                "custom": {
                  "axisCenteredZero": false,
                  "axisColorMode": "text",
                  "axisLabel": "Bytes",
                  "axisPlacement": "auto",
                  "barAlignment": 0,
                  "drawStyle": "line",
                  "fillOpacity": 25,
                  "gradientMode": "opacity",
                  "hideFrom": {
                    "legend": false,
                    "tooltip": false,
                    "viz": false
                  },
                  "insertNulls": false,
                  "lineInterpolation": "smooth",
                  "lineStyle": {
                    "fill": "solid"
                  },
                  "lineWidth": 2,
                  "pointSize": 5,
                  "scaleDistribution": {
                    "type": "linear"
                  },
                  "showPoints": "never",
                  "spanNulls": false,
                  "stacking": {
                    "group": "A",
                    "mode": "none"
                  },
                  "thresholdsStyle": {
                    "mode": "off"
                  }
                },
                "decimals": 2,
                "mappings": [],
                "thresholds": {
                  "mode": "absolute",
                  "steps": [
                    {
                      "color": "green",
                      "value": null
                    },
                    {
                      "color": "red",
                      "value": 80
                    }
                  ]
                },
                "unit": "bytes"
              },
              "overrides": []
            },
            "gridPos": {
              "h": 8,
              "w": 12,
              "x": 12,
              "y": 22
            },
            "id": 51,
            "options": {
              "legend": {
                "calcs": [
                  "min",
                  "max",
                  "mean"
                ],
                "displayMode": "table",
                "placement": "right",
                "showLegend": true
              },
              "tooltip": {
                "mode": "multi",
                "sort": "desc"
              }
            },
            "pluginVersion": "8.3.3",
            "targets": [
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "$${datasource}"
                },
                "editorMode": "code",
                "exemplar": true,
                "expr": "sum(container_memory_working_set_bytes{namespace=\"$namespace\", pod=\"$pod\", image!=\"\", container!=\"\"}) by (container)",
                "interval": "",
                "legendFormat": "{{ container }}",
                "range": true,
                "refId": "A"
              }
            ],
            "title": "Memory Usage by container",
            "type": "timeseries"
          },
          {
            "datasource": {
              "type": "prometheus",
              "uid": "$${datasource}"
            },
            "description": "",
            "fieldConfig": {
              "defaults": {
                "color": {
                  "mode": "palette-classic"
                },
                "custom": {
                  "axisCenteredZero": false,
                  "axisColorMode": "text",
                  "axisLabel": "SECONDS",
                  "axisPlacement": "auto",
                  "barAlignment": 0,
                  "drawStyle": "line",
                  "fillOpacity": 25,
                  "gradientMode": "opacity",
                  "hideFrom": {
                    "legend": false,
                    "tooltip": false,
                    "viz": false
                  },
                  "insertNulls": false,
                  "lineInterpolation": "smooth",
                  "lineStyle": {
                    "fill": "solid"
                  },
                  "lineWidth": 2,
                  "pointSize": 5,
                  "scaleDistribution": {
                    "type": "linear"
                  },
                  "showPoints": "never",
                  "spanNulls": false,
                  "stacking": {
                    "group": "A",
                    "mode": "none"
                  },
                  "thresholdsStyle": {
                    "mode": "off"
                  }
                },
                "decimals": 2,
                "mappings": [],
                "thresholds": {
                  "mode": "absolute",
                  "steps": [
                    {
                      "color": "green",
                      "value": null
                    },
                    {
                      "color": "red",
                      "value": 80
                    }
                  ]
                },
                "unit": "s"
              },
              "overrides": []
            },
            "gridPos": {
              "h": 8,
              "w": 12,
              "x": 0,
              "y": 30
            },
            "id": 59,
            "options": {
              "legend": {
                "calcs": [
                  "min",
                  "max",
                  "mean"
                ],
                "displayMode": "table",
                "placement": "right",
                "showLegend": true,
                "sortBy": "Max",
                "sortDesc": true
              },
              "tooltip": {
                "mode": "single",
                "sort": "none"
              }
            },
            "pluginVersion": "8.3.3",
            "targets": [
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "$${datasource}"
                },
                "editorMode": "code",
                "exemplar": true,
                "expr": "sum(rate(container_cpu_cfs_throttled_seconds_total{namespace=~\"$namespace\", pod=\"$pod\", image!=\"\", container!=\"\"}[$__rate_interval])) by (container)",
                "interval": "$resolution",
                "legendFormat": "{{ container }}",
                "range": true,
                "refId": "A"
              }
            ],
            "title": "CPU Throttled seconds by container",
            "type": "timeseries"
          },
          {
            "collapsed": false,
            "gridPos": {
              "h": 1,
              "w": 24,
              "x": 0,
              "y": 38
            },
            "id": 62,
            "panels": [],
            "title": "Kubernetes",
            "type": "row"
          },
          {
            "datasource": {
              "type": "prometheus",
              "uid": "$${datasource}"
            },
            "fieldConfig": {
              "defaults": {
                "color": {
                  "fixedColor": "blue",
                  "mode": "thresholds"
                },
                "custom": {
                  "axisCenteredZero": false,
                  "axisColorMode": "text",
                  "axisLabel": "Percent",
                  "axisPlacement": "auto",
                  "barAlignment": 0,
                  "drawStyle": "line",
                  "fillOpacity": 25,
                  "gradientMode": "opacity",
                  "hideFrom": {
                    "legend": false,
                    "tooltip": false,
                    "viz": false
                  },
                  "insertNulls": false,
                  "lineInterpolation": "smooth",
                  "lineStyle": {
                    "fill": "solid"
                  },
                  "lineWidth": 2,
                  "pointSize": 5,
                  "scaleDistribution": {
                    "type": "linear"
                  },
                  "showPoints": "never",
                  "spanNulls": false,
                  "stacking": {
                    "group": "A",
                    "mode": "none"
                  },
                  "thresholdsStyle": {
                    "mode": "area"
                  }
                },
                "mappings": [],
                "max": 1,
                "min": 0,
                "thresholds": {
                  "mode": "percentage",
                  "steps": [
                    {
                      "color": "red",
                      "value": null
                    },
                    {
                      "color": "yellow",
                      "value": 20
                    },
                    {
                      "color": "green",
                      "value": 30
                    },
                    {
                      "color": "#EAB839",
                      "value": 70
                    },
                    {
                      "color": "red",
                      "value": 80
                    }
                  ]
                },
                "unit": "none"
              },
              "overrides": []
            },
            "gridPos": {
              "h": 8,
              "w": 12,
              "x": 0,
              "y": 39
            },
            "id": 60,
            "options": {
              "legend": {
                "calcs": [],
                "displayMode": "table",
                "placement": "right",
                "showLegend": true
              },
              "tooltip": {
                "mode": "multi",
                "sort": "desc"
              }
            },
            "pluginVersion": "8.3.3",
            "targets": [
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "$${datasource}"
                },
                "editorMode": "code",
                "exemplar": true,
                "expr": "sum(increase(container_oom_events_total{namespace=\"$${namespace}\", pod=\"$${pod}\", container!=\"\"}[$__rate_interval])) by (container)",
                "interval": "",
                "legendFormat": "{{ container }}",
                "range": true,
                "refId": "A"
              }
            ],
            "title": "OOM Events by container",
            "type": "timeseries"
          },
          {
            "datasource": {
              "type": "prometheus",
              "uid": "$${datasource}"
            },
            "fieldConfig": {
              "defaults": {
                "color": {
                  "fixedColor": "blue",
                  "mode": "thresholds"
                },
                "custom": {
                  "axisCenteredZero": false,
                  "axisColorMode": "text",
                  "axisLabel": "Percent",
                  "axisPlacement": "auto",
                  "barAlignment": 0,
                  "drawStyle": "line",
                  "fillOpacity": 25,
                  "gradientMode": "opacity",
                  "hideFrom": {
                    "legend": false,
                    "tooltip": false,
                    "viz": false
                  },
                  "insertNulls": false,
                  "lineInterpolation": "smooth",
                  "lineStyle": {
                    "fill": "solid"
                  },
                  "lineWidth": 2,
                  "pointSize": 5,
                  "scaleDistribution": {
                    "type": "linear"
                  },
                  "showPoints": "never",
                  "spanNulls": false,
                  "stacking": {
                    "group": "A",
                    "mode": "none"
                  },
                  "thresholdsStyle": {
                    "mode": "area"
                  }
                },
                "mappings": [],
                "max": 1,
                "min": 0,
                "thresholds": {
                  "mode": "percentage",
                  "steps": [
                    {
                      "color": "red",
                      "value": null
                    },
                    {
                      "color": "yellow",
                      "value": 20
                    },
                    {
                      "color": "green",
                      "value": 30
                    },
                    {
                      "color": "#EAB839",
                      "value": 70
                    },
                    {
                      "color": "red",
                      "value": 80
                    }
                  ]
                },
                "unit": "none"
              },
              "overrides": []
            },
            "gridPos": {
              "h": 8,
              "w": 12,
              "x": 12,
              "y": 39
            },
            "id": 61,
            "options": {
              "legend": {
                "calcs": [],
                "displayMode": "table",
                "placement": "right",
                "showLegend": true
              },
              "tooltip": {
                "mode": "multi",
                "sort": "desc"
              }
            },
            "pluginVersion": "8.3.3",
            "targets": [
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "$${datasource}"
                },
                "editorMode": "code",
                "exemplar": true,
                "expr": "sum(increase(kube_pod_container_status_restarts_total{namespace=~\"$${namespace}\", pod=\"$${pod}\", container!=\"\"}[$__rate_interval])) by (container)",
                "interval": "",
                "legendFormat": "{{ container }}",
                "range": true,
                "refId": "A"
              }
            ],
            "title": "Container Restarts by container",
            "type": "timeseries"
          },
          {
            "collapsed": false,
            "datasource": {
              "type": "datasource",
              "uid": "grafana"
            },
            "gridPos": {
              "h": 1,
              "w": 24,
              "x": 0,
              "y": 47
            },
            "id": 45,
            "panels": [],
            "targets": [
              {
                "datasource": {
                  "type": "datasource",
                  "uid": "grafana"
                },
                "refId": "A"
              }
            ],
            "title": "Network",
            "type": "row"
          },
          {
            "datasource": {
              "type": "prometheus",
              "uid": "$${datasource}"
            },
            "fieldConfig": {
              "defaults": {
                "color": {
                  "mode": "palette-classic"
                },
                "custom": {
                  "axisCenteredZero": false,
                  "axisColorMode": "text",
                  "axisLabel": "",
                  "axisPlacement": "auto",
                  "barAlignment": 0,
                  "drawStyle": "line",
                  "fillOpacity": 25,
                  "gradientMode": "opacity",
                  "hideFrom": {
                    "legend": false,
                    "tooltip": false,
                    "viz": false
                  },
                  "insertNulls": false,
                  "lineInterpolation": "smooth",
                  "lineWidth": 2,
                  "pointSize": 5,
                  "scaleDistribution": {
                    "type": "linear"
                  },
                  "showPoints": "never",
                  "spanNulls": false,
                  "stacking": {
                    "group": "A",
                    "mode": "none"
                  },
                  "thresholdsStyle": {
                    "mode": "off"
                  }
                },
                "mappings": [],
                "thresholds": {
                  "mode": "absolute",
                  "steps": [
                    {
                      "color": "green",
                      "value": null
                    },
                    {
                      "color": "red",
                      "value": 80
                    }
                  ]
                },
                "unit": "bytes"
              },
              "overrides": []
            },
            "gridPos": {
              "h": 8,
              "w": 12,
              "x": 0,
              "y": 48
            },
            "id": 31,
            "options": {
              "legend": {
                "calcs": [],
                "displayMode": "list",
                "placement": "bottom",
                "showLegend": true
              },
              "tooltip": {
                "mode": "multi",
                "sort": "none"
              }
            },
            "pluginVersion": "8.3.3",
            "targets": [
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "$${datasource}"
                },
                "exemplar": true,
                "expr": "sum(rate(container_network_receive_bytes_total{namespace=\"$namespace\", pod=\"$pod\"}[$__rate_interval]))",
                "interval": "$resolution",
                "legendFormat": "Received",
                "refId": "A"
              },
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "$${datasource}"
                },
                "exemplar": true,
                "expr": "- sum(rate(container_network_transmit_bytes_total{namespace=\"$namespace\", pod=\"$pod\"}[$__rate_interval]))",
                "interval": "$resolution",
                "legendFormat": "Transmitted",
                "refId": "B"
              }
            ],
            "title": "Network - Bandwidth",
            "type": "timeseries"
          },
          {
            "datasource": {
              "type": "prometheus",
              "uid": "$${datasource}"
            },
            "fieldConfig": {
              "defaults": {
                "color": {
                  "mode": "palette-classic"
                },
                "custom": {
                  "axisCenteredZero": false,
                  "axisColorMode": "text",
                  "axisLabel": "",
                  "axisPlacement": "auto",
                  "barAlignment": 0,
                  "drawStyle": "line",
                  "fillOpacity": 25,
                  "gradientMode": "opacity",
                  "hideFrom": {
                    "legend": false,
                    "tooltip": false,
                    "viz": false
                  },
                  "insertNulls": false,
                  "lineInterpolation": "smooth",
                  "lineWidth": 2,
                  "pointSize": 5,
                  "scaleDistribution": {
                    "type": "linear"
                  },
                  "showPoints": "never",
                  "spanNulls": false,
                  "stacking": {
                    "group": "A",
                    "mode": "none"
                  },
                  "thresholdsStyle": {
                    "mode": "off"
                  }
                },
                "mappings": [],
                "thresholds": {
                  "mode": "absolute",
                  "steps": [
                    {
                      "color": "green",
                      "value": null
                    },
                    {
                      "color": "red",
                      "value": 80
                    }
                  ]
                },
                "unit": "pps"
              },
              "overrides": []
            },
            "gridPos": {
              "h": 8,
              "w": 12,
              "x": 12,
              "y": 48
            },
            "id": 34,
            "options": {
              "legend": {
                "calcs": [],
                "displayMode": "list",
                "placement": "bottom",
                "showLegend": true
              },
              "tooltip": {
                "mode": "multi",
                "sort": "none"
              }
            },
            "pluginVersion": "8.3.3",
            "targets": [
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "$${datasource}"
                },
                "exemplar": true,
                "expr": "sum(rate(container_network_receive_packets_total{namespace=\"$namespace\", pod=\"$pod\"}[$__rate_interval]))",
                "interval": "$resolution",
                "legendFormat": "Received",
                "refId": "A"
              },
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "$${datasource}"
                },
                "exemplar": true,
                "expr": "- sum(rate(container_network_transmit_packets_total{namespace=\"$namespace\", pod=\"$pod\"}[$__rate_interval]))",
                "interval": "$resolution",
                "legendFormat": "Transmitted",
                "refId": "B"
              }
            ],
            "title": "Network - Packets Rate",
            "type": "timeseries"
          },
          {
            "datasource": {
              "type": "prometheus",
              "uid": "$${datasource}"
            },
            "fieldConfig": {
              "defaults": {
                "color": {
                  "mode": "palette-classic"
                },
                "custom": {
                  "axisCenteredZero": false,
                  "axisColorMode": "text",
                  "axisLabel": "",
                  "axisPlacement": "auto",
                  "barAlignment": 0,
                  "drawStyle": "line",
                  "fillOpacity": 25,
                  "gradientMode": "opacity",
                  "hideFrom": {
                    "legend": false,
                    "tooltip": false,
                    "viz": false
                  },
                  "insertNulls": false,
                  "lineInterpolation": "smooth",
                  "lineWidth": 2,
                  "pointSize": 5,
                  "scaleDistribution": {
                    "type": "linear"
                  },
                  "showPoints": "never",
                  "spanNulls": false,
                  "stacking": {
                    "group": "A",
                    "mode": "none"
                  },
                  "thresholdsStyle": {
                    "mode": "off"
                  }
                },
                "mappings": [],
                "thresholds": {
                  "mode": "absolute",
                  "steps": [
                    {
                      "color": "green"
                    },
                    {
                      "color": "red",
                      "value": 80
                    }
                  ]
                },
                "unit": "pps"
              },
              "overrides": []
            },
            "gridPos": {
              "h": 8,
              "w": 12,
              "x": 0,
              "y": 56
            },
            "id": 36,
            "options": {
              "legend": {
                "calcs": [],
                "displayMode": "list",
                "placement": "bottom",
                "showLegend": true
              },
              "tooltip": {
                "mode": "multi",
                "sort": "none"
              }
            },
            "pluginVersion": "8.3.3",
            "targets": [
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "$${datasource}"
                },
                "exemplar": true,
                "expr": "sum(rate(container_network_receive_packets_dropped_total{namespace=\"$namespace\", pod=\"$pod\"}[$__rate_interval]))",
                "interval": "$resolution",
                "legendFormat": "Received",
                "refId": "A"
              },
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "$${datasource}"
                },
                "exemplar": true,
                "expr": "- sum(rate(container_network_transmit_packets_dropped_total{namespace=\"$namespace\", pod=\"$pod\"}[$__rate_interval]))",
                "interval": "$resolution",
                "legendFormat": "Transmitted",
                "refId": "B"
              }
            ],
            "title": "Network - Packets Dropped",
            "type": "timeseries"
          },
          {
            "datasource": {
              "type": "prometheus",
              "uid": "$${datasource}"
            },
            "fieldConfig": {
              "defaults": {
                "color": {
                  "mode": "palette-classic"
                },
                "custom": {
                  "axisCenteredZero": false,
                  "axisColorMode": "text",
                  "axisLabel": "",
                  "axisPlacement": "auto",
                  "barAlignment": 0,
                  "drawStyle": "line",
                  "fillOpacity": 25,
                  "gradientMode": "opacity",
                  "hideFrom": {
                    "legend": false,
                    "tooltip": false,
                    "viz": false
                  },
                  "insertNulls": false,
                  "lineInterpolation": "smooth",
                  "lineWidth": 2,
                  "pointSize": 5,
                  "scaleDistribution": {
                    "type": "linear"
                  },
                  "showPoints": "never",
                  "spanNulls": false,
                  "stacking": {
                    "group": "A",
                    "mode": "none"
                  },
                  "thresholdsStyle": {
                    "mode": "off"
                  }
                },
                "mappings": [],
                "thresholds": {
                  "mode": "absolute",
                  "steps": [
                    {
                      "color": "green"
                    },
                    {
                      "color": "red",
                      "value": 80
                    }
                  ]
                },
                "unit": "pps"
              },
              "overrides": []
            },
            "gridPos": {
              "h": 8,
              "w": 12,
              "x": 12,
              "y": 56
            },
            "id": 37,
            "options": {
              "legend": {
                "calcs": [],
                "displayMode": "list",
                "placement": "bottom",
                "showLegend": true
              },
              "tooltip": {
                "mode": "multi",
                "sort": "none"
              }
            },
            "pluginVersion": "8.3.3",
            "targets": [
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "$${datasource}"
                },
                "exemplar": true,
                "expr": "sum(rate(container_network_receive_errors_total{namespace=\"$namespace\", pod=\"$pod\"}[$__rate_interval]))",
                "interval": "$resolution",
                "legendFormat": "Received",
                "refId": "A"
              },
              {
                "datasource": {
                  "type": "prometheus",
                  "uid": "$${datasource}"
                },
                "exemplar": true,
                "expr": "- sum(rate(container_network_transmit_errors_total{namespace=\"$namespace\", pod=\"$pod\"}[$__rate_interval]))",
                "interval": "$resolution",
                "legendFormat": "Transmitted",
                "refId": "B"
              }
            ],
            "title": "Network - Errors",
            "type": "timeseries"
          }
        ],
        "refresh": "30s",
        "schemaVersion": 38,
        "style": "dark",
        "tags": [
          "Kubernetes",
          "Prometheus"
        ],
        "templating": {
          "list": [
            {
              "current": {
                "selected": false,
                "text": "Prometheus",
                "value": "Prometheus"
              },
              "hide": 0,
              "includeAll": false,
              "multi": false,
              "name": "datasource",
              "options": [],
              "query": "prometheus",
              "queryValue": "",
              "refresh": 1,
              "regex": "",
              "skipUrlSync": false,
              "type": "datasource"
            },
            {
              "current": {
                "selected": false,
                "text": "monitoring",
                "value": "monitoring"
              },
              "datasource": {
                "type": "prometheus",
                "uid": "$${datasource}"
              },
              "definition": "label_values(kube_pod_info, namespace)",
              "hide": 0,
              "includeAll": false,
              "multi": false,
              "name": "namespace",
              "options": [],
              "query": {
                "query": "label_values(kube_pod_info, namespace)",
                "refId": "Prometheus-namespace-Variable-Query"
              },
              "refresh": 1,
              "regex": "",
              "skipUrlSync": false,
              "sort": 1,
              "tagValuesQuery": "",
              "tagsQuery": "",
              "type": "query",
              "useTags": false
            },
            {
              "current": {
                "selected": false,
                "text": "",
                "value": ""
              },
              "datasource": {
                "type": "prometheus",
                "uid": "$${datasource}"
              },
              "definition": "label_values(kube_pod_info{namespace=\"$namespace\"}, pod)",
              "hide": 0,
              "includeAll": false,
              "multi": false,
              "name": "pod",
              "options": [],
              "query": {
                "query": "label_values(kube_pod_info{namespace=\"$namespace\"}, pod)",
                "refId": "Prometheus-pod-Variable-Query"
              },
              "refresh": 2,
              "regex": "",
              "skipUrlSync": false,
              "sort": 1,
              "tagValuesQuery": "",
              "tagsQuery": "",
              "type": "query",
              "useTags": false
            },
            {
              "current": {
                "selected": true,
                "text": "30s",
                "value": "30s"
              },
              "hide": 0,
              "includeAll": false,
              "multi": false,
              "name": "resolution",
              "options": [
                {
                  "selected": false,
                  "text": "1s",
                  "value": "1s"
                },
                {
                  "selected": false,
                  "text": "15s",
                  "value": "15s"
                },
                {
                  "selected": true,
                  "text": "30s",
                  "value": "30s"
                },
                {
                  "selected": false,
                  "text": "1m",
                  "value": "1m"
                },
                {
                  "selected": false,
                  "text": "3m",
                  "value": "3m"
                },
                {
                  "selected": false,
                  "text": "5m",
                  "value": "5m"
                }
              ],
              "query": "1s, 15s, 30s, 1m, 3m, 5m",
              "queryValue": "",
              "skipUrlSync": false,
              "type": "custom"
            }
          ]
        },
        "time": {
          "from": "now-1h",
          "to": "now"
        },
        "timepicker": {},
        "timezone": "",
        "title": "Kubernetes / Views / Pods",
        "uid": "k8s_views_pods",
        "version": 22,
        "weekStart": ""
      }
      
      EOT
    }
    "kind" = "ConfigMap"
    "metadata" = {
      "annotations" = {
        "grafana_folder" = "Kubernetes"
      }
      "labels" = {
        "grafana_dashboard" = "1"
      }
      "name"      = "dashboards-k8s-views-pods"
      "namespace" = "prometheus"
    }
  }
}

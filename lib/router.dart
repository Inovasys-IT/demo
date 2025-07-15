import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'features/auth/presentation/login_screen.dart';
import 'features/auth/presentation/equipment_screen.dart';
import 'features/home/home_screen.dart';
import 'features/reception/reception_screen.dart';
import 'features/reception/reception_lines_screen.dart';
import 'features/reception/reception_line_detail_screen.dart';
import 'features/rangement/rangement_screen.dart';
import 'features/replenishment/replenishment_screen.dart';
import 'features/orders/order_screen.dart';
import 'features/orders/picking_task_screen.dart';
import 'features/orders/support_pick_validation_screen.dart';
import 'features/orders/expedition_task_screen.dart';
import 'features/orders/loading_screen.dart';
import 'features/orders/loading_summary_screen.dart';
import 'features/inventory/inventory_screen.dart';

/// Builds the router for the application.
GoRouter buildRouter() {
  return GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: '/equipment',
        builder: (context, state) => const EquipmentScreen(),
      ),
      GoRoute(
        path: '/home',
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        path: '/reception',
        builder: (context, state) => const ReceptionScreen(),
        routes: [
          GoRoute(
            path: 'lines',
            builder: (context, state) => const ReceptionLinesScreen(),
          ),
          GoRoute(
            path: 'lineDetail',
            builder: (context, state) => const ReceptionLineDetailScreen(),
          ),
        ],
      ),
      GoRoute(
        path: '/rangement',
        builder: (context, state) => const RangementScreen(),
      ),
      GoRoute(
        path: '/replenishment',
        builder: (context, state) => const ReplenishmentScreen(),
      ),
      GoRoute(
        path: '/orders',
        builder: (context, state) => const OrderScreen(),
        routes: [
          GoRoute(
            path: 'picking',
            builder: (context, state) => const PickingTaskScreen(),
          ),
          GoRoute(
            path: 'support-validation',
            builder: (context, state) => const SupportPickValidationScreen(),
          ),
          GoRoute(
            path: 'expedition',
            builder: (context, state) => const ExpeditionTaskScreen(),
          ),
          GoRoute(
            path: 'loading',
            builder: (context, state) => const LoadingScreen(),
          ),
          GoRoute(
            path: 'summary',
            builder: (context, state) => const LoadingSummaryScreen(),
          ),
        ],
      ),
      GoRoute(
        path: '/inventory',
        builder: (context, state) => const InventoryScreen(),
      ),
    ],
  );
}

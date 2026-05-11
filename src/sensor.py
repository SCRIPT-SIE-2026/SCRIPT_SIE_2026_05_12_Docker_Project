#!/usr/bin/env python3
"""Simple TCP temperature sensor simulator.

Usage:
    python3 src/sensor.py [bind_ip] [bind_port]
"""

import argparse
import random
import socket
import time


DEFAULT_HOST = "0.0.0.0"
DEFAULT_PORT = 1234


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(description="Run a fake temperature sensor server.")
    parser.add_argument("host", nargs="?", default=DEFAULT_HOST, help="IP address to bind.")
    parser.add_argument(
        "port",
        nargs="?",
        default=DEFAULT_PORT,
        type=int,
        help="TCP port to bind.",
    )
    parser.add_argument(
        "--interval",
        default=0.1,
        type=float,
        help="Seconds between two measurements.",
    )
    return parser.parse_args()


def generate_temperature() -> float:
    """Return one simulated temperature measurement in degrees Celsius."""
    return random.gauss(mu=25.0, sigma=2.0)


def send_measurements(connection: socket.socket, interval: float) -> None:
    while True:
        temperature = generate_temperature()
        message = f"{temperature:.2f}\n".encode("utf-8")
        connection.sendall(message)
        time.sleep(interval)


def main() -> None:
    args = parse_args()
    server_address = (args.host, args.port)

    with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as sock:
        sock.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)
        sock.bind(server_address)
        sock.listen(1)
        print(f"Sensor listening on {args.host}:{args.port}")

        while True:
            print("Waiting for a connection...")
            connection, client_address = sock.accept()
            with connection:
                print(f"Connection from {client_address}")
                try:
                    send_measurements(connection, args.interval)
                except (BrokenPipeError, ConnectionResetError):
                    print(f"Connection closed by {client_address}")


if __name__ == "__main__":
    main()

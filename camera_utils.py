import logging

logger = logging.getLogger(__name__)


def detect_cameras():
    """USB camera detection removed from this build. Return empty list."""
    logger.info("[CAMERA] detect_cameras: USB camera support removed. Returning empty list.")
    return []


class UsbCamera:
    def __init__(self, camera_id=0):
        raise NotImplementedError("USB camera support is removed from this build.")


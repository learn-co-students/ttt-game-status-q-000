import sys
import unittest

from sample import sample_method

class TestSample(unittest.TestCase):
    """Any method which starts with `test_` will be considered as a test case."""

    def test_sample_method(self):
        """It does something"""

        result = sample_method()
        self.assertEqual(result, 'sample')
